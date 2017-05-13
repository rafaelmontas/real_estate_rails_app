$(document).on('turbolinks:load', function() {

  // jquery-file-upload

  $('#images_for_property').fileupload({
    add: function(e, data) {
      console.log("add", data);

      data.progressBar = $("<div class='progress' style='width: 396px'><div class='progress-bar'></div></div>").insertAfter("#images_for_property")
      var options = {
        extension: data.files[0].name.match(/(\.\w+)?$/)[0], // Set the file extension.
        _: Date.now() // Prevent caching.
      }

      $.getJSON("/images/upload/cache/presign", options, function(result) {
        console.log("presign", result);
        data.formData = result['fields'];
        data.url = result['url'];
        data.paramName = "file";


      });

      data.context = $('<button/>').text('Upload')
                .insertAfter("#images_for_property")
                .click(function () {
                    data.context = $('<p/>').text('Uploading...').replaceAll($(this));
                    data.submit();
                });

    },
    progress: function(e, data) {
      console.log("progress", data);

      var progress = parseInt(data.loaded / data.total * 100, 10);
      var percentage = progress.toString() + '%'
      data.progressBar.find(".progress-bar").css("width", percentage).html(percentage);
    },
    done: function(e,data) {
      console.log("done", data);

      // data.progressBar.remove(); // Remove progress bar.


      var image = {
        id: data.formData.key.match(/cache\/(.+)/)[1], // We have to remove the prefix
        storage: 'cache',
        metadata: {
          size: data.files[0].size,
          filename: data.files[0].name.match(/[^\/\\]+$/)[0], // IE return full path
          mime_type: data.files[0].type
        }
      }

      form = $(this).closest("form");
      form_data = new FormData(form[0]);
      form_data.append($(this).attr("name"), JSON.stringify(image))

      $.ajax(form.attr("action"), {
        contentType: false,
        processData: false,
        data: form_data,
        method: form.attr("method"),
        dataType: "json",
        success: function(response) {
          console.log(response);
          // window.setTimeout(function(){location.reload()},1000) // Refresh page after upload 1sec.
        }
      });
    }
  });

});
