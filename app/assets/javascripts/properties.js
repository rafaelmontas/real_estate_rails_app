// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// Nav
$(document).on('turbolinks:load', function() {
  $(".navigation-trigger, .navigation-close").click(function() {
    $(".navigation").toggleClass("toggled");
    $('body').toggleClass("nav-opened");
  });
  $(".btn-action, .btn-link").click(function() {
    $(".sidebar-mobile").toggleClass("toggled");
    $("body").toggleClass("block-opened");
  });

  $(".header-alt-trigger, .main-block-close").click(function() {
    event.preventDefault();
    $("#main-sidebar").toggleClass("toggled");
    $("body").toggleClass("block-opened");
  });



  $(".rent_or_buy").click(function() {
    $("div.search-type").removeClass("open")
  });
  // if($('.form-control').val().length === 0){
  //   $('.form-group').toggleClass("form-group-active");
  //  }

  $(".nav-drop").hover(function() {
    $(".nav-drop-menu", this).css("display", "block");
  }, function() {
    $(".nav-drop-menu", this).css("display", "none");
  });

  $(".search-body .search-input").focusin(function() {
    $(".search-body").addClass("toggled");
  });
  // $(".search-body, .search-advanced").focusout(function() {
  //   $(".search-body").toggleClass("toggled");
  // });
  $(".prevent").click(function() {
    event.preventDefault();
  });
  $(".search-advanced .cancel").click(function() {
    $(".search-body").removeClass("toggled");
  });


  // slick carousel
  $('.listings-grid').slick({
    arrows: true,
    slidesToShow: 4,
    responsive: [
      {
        breakpoint: 1199,
        settings: {
          slidesToShow: 3
        }
      },
      {
        breakpoint: 960,
        settings: {
          slidesToShow: 2
        }
      },
      {
        breakpoint: 700,
        settings: {
          slidesToShow: 2,
          arrows: false,
          dots: true
        }
      },
      {
        breakpoint: 550,
        settings: {
          slidesToShow: 1,
          dots: true,
          arrows: false
        }
      }
    ]
  });

  //
  // function readURL(input) {
  //
  //   if (input.files && input.files[0]) {
  //     var reader = new FileReader();
  //
  //     reader.onload = function (e) {
  //       $('#preview').attr('src', e.target.result);
  //     }
  //
  //     reader.readAsDataURL(input.files[0]);
  //   }
  // }
  //
  // $("#user_avatar").change(function(){
  //     readURL(this);
  // });

  $('.default_image').click(function() {
    event.preventDefault();
    $("input#hidden").click();
  });

  // jquery-file-upload

  $('[type=file]').fileupload({
    add: function(e, data) {
      console.log("add", data);

      data.progressBar = $("<div class='progress' style='width: 396px'><div class='progress-bar'></div></div>").insertAfter("#images-upload-property")
      var options = {
        extension: data.files[0].name.match(/(\.\w+)?$/)[0], // Set the file extension.
        _: Date.now() // Prevent caching.
      }

      $.getJSON("/images/upload/cache/presign", options, function(result) {
        console.log("presign", result);
        data.formData = result['fields'];
        data.url = result['url'];
        data.paramName = "file";
        data.submit()

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
        }
      });

    }
  });

});

// $('.default_image').click(function() {
//   $("#user_avatar input[type='button']").click();
// });

// $('.default_image').click(function() {
//   $("#user_avatar").trigger('click');
// });

var loadFile = function(event) {
  var output = document.getElementById('output');
  output.src = URL.createObjectURL(event.target.files[0]);
};
