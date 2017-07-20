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
    $(".rmd-sidebar").toggleClass("toggled");
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

  $('.default-1').click(function() {
    event.preventDefault();
    $("input#hidden1").click();
  });
  $('.default-2').click(function() {
    event.preventDefault();
    $("input#hidden2").click();
  });
  $('.default-3').click(function() {
    event.preventDefault();
    $("input#hidden3").click();
  });
  $('.default-4').click(function() {
    event.preventDefault();
    $("input#hidden4").click();
  });
  $('.default-5').click(function() {
    event.preventDefault();
    $("input#hidden5").click();
  });
  $('.default-6').click(function() {
    event.preventDefault();
    $("input#hidden6").click();
  });
  $('.default-7').click(function() {
    event.preventDefault();
    $("input#hidden7").click();
  });
  $('.default-8').click(function() {
    event.preventDefault();
    $("input#hidden8").click();
  });

  // Home search
  $('#property-status-wrapper #comprar').click(function() {
    $("#property-status-wrapper input[type='radio']#q_sale_cont_venta").click();
  });

  $('#property-status-wrapper #alquilar').click(function() {
    $("#property-status-wrapper input[type='radio']#q_sale_cont_alquiler").click();
  });


      // Home search autocomplete jquery
      var availableTags = [
        "Naco",
        "Piantini",
        "Arroyo Hondo"
      ];
      $(".search-input-group input[type='text']").autocomplete({
        source: availableTags
      });

      // Preview multiple images  (pure JavaScript)////////////////////////////////////////////////////////////////////
      function previewImages() {

        var preview = document.querySelector('#preview');

        if (this.files) {
          [].forEach.call(this.files, readAndPreview);
        }

        function readAndPreview(file) {

          // Make sure `file.name` matches our extensions criteria
          if (!/\.(jpe?g|png|gif)$/i.test(file.name)) {
            return alert(file.name + " is not an image");
          } // else...

          var reader = new FileReader();

          reader.addEventListener("load", function() {
            var image = new Image();
            image.height = 100;
            image.title  = file.name;
            image.src    = this.result;
            preview.appendChild(image);
          }, false);

          reader.readAsDataURL(file);

        }

      }

      var images_for_property = document.querySelector('#images_for_property');

      if (images_for_property) {
        document.querySelector('#images_for_property').addEventListener("change", previewImages, false);
      }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      // Navbar
      // $('li.dropnav a').click(function(event) {
        // event.preventDefault();
        // $(this).parent().toggleClass('open');
        // event.stopPropagation();
        // $(this).toggleClass('open');

      // });

      $("#scroll").click(function (){
        $('body').toggleClass("nav-opened");
        $('html, body').animate({
          scrollTop: $("#scroll").offset().top
        }, 0);
      });

///////////////////////////////////// -Mobile- /////////////////////////////////////////////////////////////

      // Mobile buy/rent click ///////////////////////////////////////////////////////////////////////////
      $('.radio-mobile #comprar-mobile').click(function() {
        $(".radio-mobile input[type='radio']#q_sale_cont_venta_mobile").click();
      });

      $('.radio-mobile #alquilar-mobile').click(function() {
        $(".radio-mobile input[type='radio']#q_sale_cont_alquiler_mobile").click();
      });

      // Change price based on buy/rent
      function changeMobilePrice() {
        if ($(".radio-mobile input:checked").val() == "alquiler") {
          // Min
          $(".price-mobile-div #q_price_gteq option:nth-child(1)").val("500");
          $(".price-mobile-div #q_price_gteq option:nth-child(1)").text("US$ 500");
          $(".price-mobile-div #q_price_gteq option:nth-child(2)").val("750");
          $(".price-mobile-div #q_price_gteq option:nth-child(2)").text("US$ 750");
          $(".price-mobile-div #q_price_gteq option:nth-child(3)").val("1000");
          $(".price-mobile-div #q_price_gteq option:nth-child(3)").text("US$ 1,000");
          $(".price-mobile-div #q_price_gteq option:nth-child(4)").val("1250");
          $(".price-mobile-div #q_price_gteq option:nth-child(4)").text("US$ 1,250");
          $(".price-mobile-div #q_price_gteq option:nth-child(5)").val("1500");
          $(".price-mobile-div #q_price_gteq option:nth-child(5)").text("US$ 1,500");
          $(".price-mobile-div #q_price_gteq option:nth-child(6)").val("1750");
          $(".price-mobile-div #q_price_gteq option:nth-child(6)").text("US$ 1,750");
          // Max
          $(".price-mobile-div #q_price_lteq option:nth-child(1)").val("750");
          $(".price-mobile-div #q_price_lteq option:nth-child(1)").text("US$ 750");
          $(".price-mobile-div #q_price_lteq option:nth-child(2)").val("1000");
          $(".price-mobile-div #q_price_lteq option:nth-child(2)").text("US$ 1,000");
          $(".price-mobile-div #q_price_lteq option:nth-child(3)").val("1500");
          $(".price-mobile-div #q_price_lteq option:nth-child(3)").text("US$ 1,500");
          $(".price-mobile-div #q_price_lteq option:nth-child(4)").val("1750");
          $(".price-mobile-div #q_price_lteq option:nth-child(4)").text("US$ 1,750");
          $(".price-mobile-div #q_price_lteq option:nth-child(5)").val("2000");
          $(".price-mobile-div #q_price_lteq option:nth-child(5)").text("US$ 2,000");
          $(".price-mobile-div #q_price_lteq option:nth-child(6)").val("2500");
          $(".price-mobile-div #q_price_lteq option:nth-child(6)").text("US$ 2,500");

        } else if ($(".radio-mobile input:checked").val() == "venta") {
          // Min
          $(".price-mobile-div #q_price_gteq option:nth-child(1)").val("50000");
          $(".price-mobile-div #q_price_gteq option:nth-child(1)").text("US$ 50,000");
          $(".price-mobile-div #q_price_gteq option:nth-child(2)").val("100000");
          $(".price-mobile-div #q_price_gteq option:nth-child(2)").text("US$ 100,000");
          $(".price-mobile-div #q_price_gteq option:nth-child(3)").val("150000");
          $(".price-mobile-div #q_price_gteq option:nth-child(3)").text("US$ 150,000");
          $(".price-mobile-div #q_price_gteq option:nth-child(4)").val("200000");
          $(".price-mobile-div #q_price_gteq option:nth-child(4)").text("US$ 200,000");
          $(".price-mobile-div #q_price_gteq option:nth-child(5)").val("250000");
          $(".price-mobile-div #q_price_gteq option:nth-child(5)").text("US$ 250,000");
          $(".price-mobile-div #q_price_gteq option:nth-child(6)").val("300000");
          $(".price-mobile-div #q_price_gteq option:nth-child(6)").text("US$ 300,000");
          // Max
          $(".price-mobile-div #q_price_lteq option:nth-child(1)").val("50000");
          $(".price-mobile-div #q_price_lteq option:nth-child(1)").text("US$ 50,000");
          $(".price-mobile-div #q_price_lteq option:nth-child(2)").val("100000");
          $(".price-mobile-div #q_price_lteq option:nth-child(2)").text("US$ 100,000");
          $(".price-mobile-div #q_price_lteq option:nth-child(3)").val("150000");
          $(".price-mobile-div #q_price_lteq option:nth-child(3)").text("US$ 150,000");
          $(".price-mobile-div #q_price_lteq option:nth-child(4)").val("200000");
          $(".price-mobile-div #q_price_lteq option:nth-child(4)").text("US$ 200,000");
          $(".price-mobile-div #q_price_lteq option:nth-child(5)").val("350000");
          $(".price-mobile-div #q_price_lteq option:nth-child(5)").text("US$ 350,000");
          $(".price-mobile-div #q_price_lteq option:nth-child(6)").val("600000");
          $(".price-mobile-div #q_price_lteq option:nth-child(6)").text("US$ 600,000");
        }
      }
      // Change price on change.
      $(".radio-mobile input").change(function() {
        changeMobilePrice();
      });
      // Check if buy or rent are selected and change price based on that.
      if ($(".radio-mobile input:checked").val()) {
        changeMobilePrice();
      } else {
        // Set Buy as default if neither buy nor rent is selected.
        $(".radio-mobile input#q_sale_cont_venta_mobile").prop("checked", true);
      }

      // ... beds Mobile
      $('.rmd-sidebar .form-group #none').click(function() {
        $(".rmd-sidebar .form-group input[type='radio']#q_room_eq_").click();
      });
      $(".facet-bd .dropdown-menu li #none_main").click(function() {
        $(".facet-bd .dropdown-menu li input[type='radio']#none_button").click();
      });
      // 1 bed
      $('.rmd-sidebar .form-group #one').click(function() {
        $(".rmd-sidebar .form-group input[type='radio']#q_room_eq_1").click();
      });
      // 2 beds
      $('.rmd-sidebar .form-group #two').click(function() {
        $(".rmd-sidebar .form-group input[type='radio']#q_room_eq_2").click();
      });
      // 3 beds
      $('.rmd-sidebar .form-group #three').click(function() {
        $(".rmd-sidebar .form-group input[type='radio']#q_room_eq_3").click();
      });
      // 4 beds
      $('.rmd-sidebar .form-group #four').click(function() {
        $(".rmd-sidebar .form-group input[type='radio']#q_room_eq_4").click();
      });
      // 5 beds
      $('.rmd-sidebar .form-group #five').click(function() {
        $(".rmd-sidebar .form-group input[type='radio']#q_room_eq_5").click();
      });

      // Bathrooms Mobile
      $('.rmd-sidebar .form-group #nonebath').click(function() {
        $(".rmd-sidebar .form-group input[type='radio']#q_bath_eq_").click();
      });
      $('.rmd-sidebar .form-group #one-bath').click(function() {
        $(".rmd-sidebar .form-group input[type='radio']#q_bath_eq_1").click();
      });
      $('.rmd-sidebar .form-group #two-bath').click(function() {
        $(".rmd-sidebar .form-group input[type='radio']#q_bath_eq_2").click();
      });
      $('.rmd-sidebar .form-group #three-bath').click(function() {
        $(".rmd-sidebar .form-group input[type='radio']#q_bath_eq_3").click();
      });
      $('.rmd-sidebar .form-group #four-bath').click(function() {
        $(".rmd-sidebar .form-group input[type='radio']#q_bath_eq_4").click();
      });
      $('.rmd-sidebar .form-group #five-bath').click(function() {
        $(".rmd-sidebar .form-group input[type='radio']#q_bath_eq_5").click();
      });




      ////////////////////////////////////////////////////////////////////////////////////////////////


      // Buy or Rent
      $(".facet-sale .dropdown-menu li label.click-sale").click(function() {
        $(this).prev().click();
      });
      // Change text based on value selected before search...
      var target_sale = $("#text-sale");
      var prev_sale_selected = $(".facet-sale .dropdown-menu li input[type='radio']:checked").next().text();
      if (prev_sale_selected) {
        target_sale.html(prev_sale_selected);
      } else {
        // Comprar checked by default
        comprarChecked = $(".facet-sale .dropdown-menu li input[type='radio']#q_sale_cont_venta");
        comprarChecked.prop("checked", true);
        target_sale.html(comprarChecked.next().text());
      }
      function changePriceOptions() {
        if ($(".facet-sale #text-sale").text() == "Alquilar") {
          // Min Price Alquilar
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(2)").attr("data-val", "500");
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(2)").text("$500");
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(3)").attr("data-val", "750");
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(3)").text("$750");
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(4)").attr("data-val", "1000");
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(4)").text("$1,000");
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(5)").attr("data-val", "1250");
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(5)").text("$1,250");
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(6)").attr("data-val", "1500");
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(6)").text("$1,500");
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(7)").attr("data-val", "1750");
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(7)").text("$1,750");
          // Max Price Alquilar
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(2)").attr("data-val", "750");
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(2)").text("$750");
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(3)").attr("data-val", "1000");
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(3)").text("$1,000");
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(4)").attr("data-val", "1500");
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(4)").text("$1,500");
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(5)").attr("data-val", "1750");
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(5)").text("$1,750");
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(6)").attr("data-val", "2000");
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(6)").text("$2,000");
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(7)").attr("data-val", "2500");
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(7)").text("$2,500");
        } else if ($(".facet-sale #text-sale").text() == "Comprar") {
          // Min Price Compra
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(2)").attr("data-val", "50000");
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(2)").text("$50k");
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(3)").attr("data-val", "100000");
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(3)").text("$100k");
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(4)").attr("data-val", "150000");
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(4)").text("$150k");
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(5)").attr("data-val", "200000");
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(5)").text("$200k");
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(6)").attr("data-val", "250000");
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(6)").text("$250k");
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(7)").attr("data-val", "300000");
          $(".facet-price-list-wrap #facet-price-list-min li:nth-child(7)").text("$300k");
          // Max Price Compra
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(2)").attr("data-val", "50000");
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(2)").text("$50k");
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(3)").attr("data-val", "100000");
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(3)").text("$100k");
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(4)").attr("data-val", "150000");
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(4)").text("$150k");
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(5)").attr("data-val", "200000");
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(5)").text("$200k");
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(6)").attr("data-val", "350000");
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(6)").text("$350k");
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(7)").attr("data-val", "600000");
          $(".facet-price-list-wrap #facet-price-list-max li:nth-child(7)").text("$600k");
        }
      }
      // Change text based on value selected
      $(".facet-sale .dropdown-menu li input[type='radio']").click(function() {
        var target = $("#text-sale");
        if ($(this).val()) {
          target.html($(this).next().text());
          changePriceOptions();
        } else {
          target.html("Comp/Alq");
        }
      });

      /////////////////////////////////// Price //////////////////////////////////////


      function changePrice() {
        text_min = $(".facet-price-wrap #q_price_gteq").val();
        target_min = $(".facet-price #text-price");
        text_max = $(".facet-price-wrap #q_price_lteq").val();
        target_max = $(".facet-price #text-price-max");
        target_min.text(function() {
          switch (text_min) {
            // Min Compra
            case "0":
              target_min.text("US$ 0");
              break;
            case "50000":
              target_min.text("US$ 50k");
              break;
            case "100000":
              target_min.text("US$ 100k");
              break;
            case "150000":
              target_min.text("US$ 150k");
              break;
            case "200000":
              target_min.text("US$ 200k");
              break;
            case "250000":
              target_min.text("US$ 250k");
              break;
            case "300000":
              target_min.text("US$ 300k");
              break;
            // Min Alquilar
            case "500":
              target_min.text("US$ 500");
              break;
            case "750":
              target_min.text("US$ 750");
              break;
            case "1000":
              target_min.text("US$ 1,000");
              break;
            case "1250":
              target_min.text("US$ 1,250");
              break;
            case "1500":
              target_min.text("US$ 1,500");
              break;
            case "1750":
              target_min.text("US$ 1,750");
              break;
            default:
              target_min.text("Precio");
          }
        });
        target_max.text(function() {
          switch (text_max) {
            // Max Compra
            case "0":
              target_max.text("- US$ 0");
              break;
            case "50000":
              target_max.text("- US$ 50k");
              break;
            case "100000":
              target_max.text("- US$ 100k");
              break;
            case "150000":
              target_max.text("- US$ 150k");
              break;
            case "200000":
              target_max.text("- US$ 200k");
              break;
            case "250000":
              target_max.text("- US$ 250k");
              break;
            case "350000":
              target_max.text("- US$ 350k");
              break;
            case "600000":
              target_max.text("- US$ 600k");
              break;
            // Max Alquilar
            case "750":
              target_max.text("- US$ 750");
              break;
            case "1000":
              target_max.text("- US$ 1,000");
              break;
            case "1500":
              target_max.text("- US$ 1,500");
              break;
            case "1750":
              target_max.text("- US$ 1,750");
              break;
            case "2000":
              target_max.text("- US$ 2,000");
              break;
            case "2500":
              target_max.text("- US$ 2,500");
              break;
            default:
              target_max.text("");
          }
        });
      }
      changePrice();
      changePriceOptions();

      // Price on click
      $("#facet-price-list-min li").click(function() {
        value = $(this).attr("data-val");
        $(".facet-price-wrap #q_price_gteq").val(value);
        changePrice();
      });
      $("#facet-price-list-max li").click(function() {
        value_max = $(this).attr("data-val");
        $(".facet-price-wrap #q_price_lteq").val(value_max);
        changePrice();
      });



      // Bedrooms
      $(".facet-bd .dropdown-menu li label.click").click(function() {
        $(this).prev().click();
      });
      // Change text based on value selected before search...
      var target_bd = $("#text-bd");
      var prev_bd_selected = $(".facet-bd .dropdown-menu li input[type='radio']:checked").val();
      if (prev_bd_selected) {
        target_bd.html("Dormitorios " + "(" + prev_bd_selected + ")");
      }
      // Change text based on value selected
      $(".facet-bd .dropdown-menu li input[type='radio']").click(function() {
        var target = $("#text-bd");
        if ($(this).val()) {
          target.html("Dormitorios " + "(" + $(this).val() + ")");
          $(document).load(function() {
            $(this).prop("checked", true)
          });
        } else {
          target.html("Dormitorios");
        }
      });

      // Bathrooms
      $(".facet-ba .dropdown-menu li label.click-ba").click(function() {
        $(this).prev().click();
      });
      // Change text based on value selected before search...
      var target_ba = $("#text-ba");
      var prev_ba_selected = $(".facet-ba .dropdown-menu li input[type='radio']:checked").val();
      if (prev_ba_selected) {
        target_ba.html("Dormitorios " + "(" + prev_ba_selected + ")");
      }
      // Change text based on value selected
      $(".facet-ba .dropdown-menu li input[type='radio']").click(function() {
        var target = $("#text-ba");
        if ($(this).val()) {
          target.html("Baños " + "(" + $(this).val() + ")");
        } else {
          target.html("Baños");
        }
      });






      $('.dropdown-menu').click(function (event){
        event.stopPropagation();
      });

      // form field label action
      if ($(".submit-property-content #property_address").val()) {
        $("#property_address").next().css("top", "-19px");
        $("#property_address").next().css("font-size", "11px");
      }
      if ($(".submit-property-content #property_name").val()) {
        $("#property_name").next().css("top", "-19px");
        $("#property_name").next().css("font-size", "11px");
      }
      if ($(".submit-property-content #property_mts").val()) {
        $("#property_mts").next().css("top", "-19px");
        $("#property_mts").next().css("font-size", "11px");
      }
      if ($(".submit-property-content #property_price").val()) {
        $("#property_price").next().css("top", "-19px");
        $("#property_price").next().css("font-size", "11px");
      }

      // Submit property
      // from 1 to 2
      $("#submit-property-1-button").click(function() {
        $(".submit-property-steps li:nth-child(1)").removeClass("active");
        $(".submit-property-content .tab-pane#submit-property-1").removeClass("active in");
        $(".submit-property-steps li:nth-child(2)").addClass("active");
        $(".submit-property-content .tab-pane#submit-property-2").addClass("active");
        window.setTimeout(function(){
          $(".submit-property-content .tab-pane#submit-property-2").addClass("in");
        }, 150);
      });
      // from 2 to 3
      $("#submit-property-2-button").click(function() {
        $(".submit-property-steps li:nth-child(2)").removeClass("active");
        $(".submit-property-content .tab-pane#submit-property-2").removeClass("active in");
        $(".submit-property-steps li:nth-child(3)").addClass("active");
        $(".submit-property-content .tab-pane#submit-property-3").addClass("active");
        window.setTimeout(function(){
          $(".submit-property-content .tab-pane#submit-property-3").addClass("in");
        }, 150);
      });
      // from 3 to 4
      $("#submit-property-3-button").click(function() {
        $(".submit-property-steps li:nth-child(3)").removeClass("active");
        $(".submit-property-content .tab-pane#submit-property-3").removeClass("active in");
        $(".submit-property-steps li:nth-child(4)").addClass("active");
        $(".submit-property-content .tab-pane#submit-property-4").addClass("active");
        window.setTimeout(function(){
          $(".submit-property-content .tab-pane#submit-property-4").addClass("in");
        }, 150);
      });
      // Show pane #1 by default
      if ($(".submit-property-steps li:nth-child(1)").attr("class") == "active") {
        $(".submit-property-content .tab-pane").removeClass("active in");
        $(".submit-property-content .tab-pane#submit-property-1").addClass("active in");
      }
      // Show panes based on click
      $(".submit-property-steps li").click(function() {
        // Background Color
        $(".submit-property-steps li").removeClass("active");
        $(this).addClass("active");

        // show pane
        if ($(".submit-property-steps li:nth-child(1)").attr("class") == "active") {
          $(".submit-property-content .tab-pane").removeClass("active in");
          $(".submit-property-content .tab-pane#submit-property-1").addClass("active");
          window.setTimeout(function(){
            $(".submit-property-content .tab-pane#submit-property-1").addClass("in");
          }, 150);
        } else if ($(".submit-property-steps li:nth-child(2)").attr("class") == "active") {
          $(".submit-property-content .tab-pane").removeClass("active in");
          $(".submit-property-content .tab-pane#submit-property-2").addClass("active");
          window.setTimeout(function(){
            $(".submit-property-content .tab-pane#submit-property-2").addClass("in");
          }, 150);
        } else if ($(".submit-property-steps li:nth-child(3)").attr("class") == "active") {
          $(".submit-property-content .tab-pane").removeClass("active in");
          $(".submit-property-content .tab-pane#submit-property-3").addClass("active");
          window.setTimeout(function(){
            $(".submit-property-content .tab-pane#submit-property-3").addClass("in");
          }, 150);
        } else if ($(".submit-property-steps li:nth-child(4)").attr("class") == "active") {
          $(".submit-property-content .tab-pane").removeClass("active in");
          $(".submit-property-content .tab-pane#submit-property-4").addClass("active");
          window.setTimeout(function(){
            $(".submit-property-content .tab-pane#submit-property-4").addClass("in");
          }, 150);
        }
      });
      // form
      // pane #1
      $(".form-group #property_address").change(function() {
        if ($(".form-group #property_address").val()) {
          $(".form-group-float#form-for-address").addClass("form-group-active");
        } else {
          $(".form-group-float#form-for-address").removeClass("form-group-active");
        }
      });
      $(".form-group #property_name").change(function() {
        if ($(".form-group #property_name").val()) {
          $(".form-group-float#form-for-name").addClass("form-group-active");
        } else {
          $(".form-group-float#form-for-name").removeClass("form-group-active");
        }
      });
      // pane #2
      $(".form-group #property_mts").change(function() {
        if ($(".form-group #property_mts").val()) {
          $(".form-group-float#form-for-mts").addClass("form-group-active");
        } else {
          $(".form-group-float#form-for-mts").removeClass("form-group-active");
        }
      });
      $(".form-group #property_price").change(function() {
        if ($(".form-group #property_price").val()) {
          $(".form-group-float#form-for-price").addClass("form-group-active");
        } else {
          $(".form-group-float#form-for-price").removeClass("form-group-active");
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

// property images
var loadFile1 = function(event) {
  var output1 = document.getElementById('output1');
  output1.src = URL.createObjectURL(event.target.files[0]);
};
var loadFile2 = function(event) {
  var output2 = document.getElementById('output2');
  output2.src = URL.createObjectURL(event.target.files[0]);
};
var loadFile3 = function(event) {
  var output3 = document.getElementById('output3');
  output3.src = URL.createObjectURL(event.target.files[0]);
};
var loadFile4 = function(event) {
  var output4 = document.getElementById('output4');
  output4.src = URL.createObjectURL(event.target.files[0]);
};
var loadFile5 = function(event) {
  var output5 = document.getElementById('output5');
  output5.src = URL.createObjectURL(event.target.files[0]);
};
var loadFile6 = function(event) {
  var output6 = document.getElementById('output6');
  output6.src = URL.createObjectURL(event.target.files[0]);
};
var loadFile7 = function(event) {
  var output7 = document.getElementById('output7');
  output7.src = URL.createObjectURL(event.target.files[0]);
};
var loadFile8 = function(event) {
  var output8 = document.getElementById('output8');
  output8.src = URL.createObjectURL(event.target.files[0]);
};

// Fixed header search results
$(window).scroll(function(){
  var sticky = $('.affix-top'),
      scroll = $(window).scrollTop();

  if (scroll >= 114) sticky.addClass('affix'), $(".search-results").css( "margin-top", "68px" );
  else sticky.removeClass('affix'), $(".search-results").css("margin-top", "0px");
});
