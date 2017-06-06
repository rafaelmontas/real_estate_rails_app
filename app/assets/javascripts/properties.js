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
      // Change text based on value selected
      $(".facet-sale .dropdown-menu li input[type='radio']").click(function() {
        var target = $("#text-sale");

        if ($(this).val()) {
          target.html($(this).next().text());
          // $(document).load(function() {
          //   $(this).prop("checked", true)
          // });
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
            default:
              target_min.text("Precio");
          }
        });
        target_max.text(function() {
          switch (text_max) {
            case "0":
              target_max.text("US$ 0");
              break;
            case "50000":
              target_max.text("US$ 50k");
              break;
            case "100000":
              target_max.text("US$ 100k");
              break;
            case "150000":
              target_max.text("US$ 150k");
              break;
            case "200000":
              target_max.text("US$ 200k");
              break;
            case "250000":
              target_max.text("US$ 250k");
              break;
            case "300000":
              target_max.text("US$ 300k");
              break;
            default:
              target_max.text("");
          }
        });
      }
      changePrice();

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


      // $(".facet-price-wrap #q_price_gteq, .facet-price-wrap #q_price_lteq").change(function() {
      //   changePrice();
      // });
      //
      // if ($(".facet-price-wrap #q_price_gteq").val() == 100000) {
      //   $(".facet-price-wrap #q_price_gteq").text("100000");
      // }

      // Change price based on prev selected
      // var targetMinPrice = $("#text-price");
      // var targetMaxPrice = $("#text-price-max");
      // var prev_min_price_selected = $(".facet-price .dropdown-menu li select#q_price_gteq").val();
      // var prev_max_price_selected = $(".facet-price .dropdown-menu li select#q_price_lteq").val();
      // var prev_price_selected_text = $(".facet-price .dropdown-menu li select#q_price_gteq option:selected").text();
      // if (prev_price_selected_text == "$us Minimo") {
      //   targetMinPrice.html("Precio");
      // } else {
      //   targetMinPrice.html(prev_price_selected_text);
      // }

      // function changePriceBasedSelected() {
      //   switch (prev_min_price_selected) {
      //     // Alquiler price range
      //     case "500":
      //       price_value_output = "500"
      //       break;
      //     case "750":
      //       price_value_output = "750"
      //       break;
      //     case "1000":
      //       price_value_output = "1,000"
      //       break;
      //     case "1250":
      //       price_value_output = "1,250"
      //       break;
      //     case "1500":
      //       price_value_output = "1,500"
      //       break;
      //     case "1750":
      //       price_value_output = "1,750"
      //       break;
      //     // Compra price range
      //     case "100000":
      //       price_value_output = "100k"
      //       break;
      //     case "200000":
      //       price_value_output = "200k"
      //       break;
      //     case "300000":
      //       price_value_output = "300k"
      //       break;
      //     case "400000":
      //       price_value_output = "400k"
      //       break;
      //     case "500000":
      //       price_value_output = "500k"
      //       break;
      //     case "600000":
      //       price_value_output = "600k"
      //       break;
      //     default:
      //       price_value_output = "Precio"
      //   }
      //   targetMinPrice.html("US$" + price_value_output);
      //
      //
      //   switch (prev_max_price_selected) {
      //     // Alquiler price range lteq
      //     case "750":
      //       max_price_value_output = "750"
      //       break;
      //     case "1000":
      //       max_price_value_output = "1,000"
      //       break;
      //     case "1250":
      //       max_price_value_output = "1,250"
      //       break;
      //     case "1500":
      //       max_price_value_output = "1,500"
      //       break;
      //     case "1750":
      //       max_price_value_output = "1,750"
      //       break;
      //     case "2000":
      //       max_price_value_output = "2,000"
      //       break;
      //     // Compra price range lteq
      //     case "100000":
      //       max_price_value_output = "100k"
      //       break;
      //     case "200000":
      //       max_price_value_output = "200k"
      //       break;
      //     case "300000":
      //       max_price_value_output = "300k"
      //       break;
      //     case "400000":
      //       max_price_value_output = "400k"
      //       break;
      //     case "500000":
      //       max_price_value_output = "500k"
      //       break;
      //     case "600000":
      //       max_price_value_output = "600k"
      //       break;
      //     default:
      //       max_price_value_output = "Precio"
      //   }
      //   targetMaxPrice.html("- US$" + max_price_value_output);
      // }
      // changePriceBasedSelected();
      // function changePrice() {
      //   if ($(".facet-sale #text-sale").text() == "Comprar") {
      //     $(".facet-price .dropdown-menu li #q_price_gteq").val(function() {
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(1)").val(100000);
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(1)").text('$US Minimo');
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(2)").val(100000);
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(2)").text('$US 100,000');
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(3)").val(200000);
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(3)").text('$US 200,000');
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(4)").val(300000);
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(4)").text('$US 300,000');
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(5)").val(400000);
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(5)").text('$US 400,000');
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(6)").val(500000);
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(6)").text('$US 500,000');
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(7)").val(600000);
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(7)").text('$US 600,000');
      //     });
      //     $(".facet-price .dropdown-menu li #q_price_lteq").val(function() {
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(1)").val(100000);
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(1)").text('$US Maximo');
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(2)").val(100000);
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(2)").text('$US 100,000');
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(3)").val(200000);
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(3)").text('$US 200,000');
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(4)").val(300000);
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(4)").text('$US 300,000');
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(5)").val(400000);
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(5)").text('$US 400,000');
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(6)").val(500000);
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(6)").text('$US 500,000');
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(7)").val(600000);
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(7)").text('$US 600,000');
      //     });
      //   } else if ($(".facet-sale #text-sale").text() == "Alquilar") {
      //     $(".facet-price .dropdown-menu li #q_price_gteq").val(function() {
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(1)").val(500);
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(1)").text('$US Minimo');
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(2)").val(500);
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(2)").text('$US 500');
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(3)").val(750);
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(3)").text('$US 750');
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(4)").val(1000);
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(4)").text('$US 1,000');
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(5)").val(1250);
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(5)").text('$US 1,250');
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(6)").val(1500);
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(6)").text('$US 1,500');
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(7)").val(1750);
      //       $(".facet-price .dropdown-menu li #q_price_gteq option:nth-child(7)").text('$US 1,750');
      //     });
      //     $(".facet-price .dropdown-menu li #q_price_lteq").val(function() {
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(1)").val(750);
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(1)").text('$US Maximo');
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(2)").val(750);
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(2)").text('$US 750');
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(3)").val(1000);
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(3)").text('$US 1,000');
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(4)").val(1250);
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(4)").text('$US 1,250');
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(5)").val(1500);
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(5)").text('$US 1,500');
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(6)").val(1750);
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(6)").text('$US 1,750');
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(7)").val(2000);
      //       $(".facet-price .dropdown-menu li #q_price_lteq option:nth-child(7)").text('$US 2,000');
      //     });
      //   }
      // }
      // changePrice();
      //
      // // Change price range based on Buy or Rent option
      // $(".facet-sale .dropdown-menu li input[type='radio']").click(function() {
      //   changePrice();
      // });
      //
      //
      // // Price
      // $(".facet-price .dropdown-menu li #q_price_gteq").change(function() {
      //   var price_value = $(this).val();
      //   var target = $("#text-price");
      //   switch (price_value) {
      //     // Alquiler price range
      //     case "500":
      //       price_value_output = "500"
      //       break;
      //     case "750":
      //       price_value_output = "750"
      //       break;
      //     case "1000":
      //       price_value_output = "1,000"
      //       break;
      //     case "1250":
      //       price_value_output = "1,250"
      //       break;
      //     case "1500":
      //       price_value_output = "1,500"
      //       break;
      //     case "1750":
      //       price_value_output = "1,750"
      //       break;
      //     // Compra price range
      //     case "100000":
      //       price_value_output = "100k"
      //       break;
      //     case "200000":
      //       price_value_output = "200k"
      //       break;
      //     case "300000":
      //       price_value_output = "300k"
      //       break;
      //     case "400000":
      //       price_value_output = "400k"
      //       break;
      //     case "500000":
      //       price_value_output = "500k"
      //       break;
      //     case "600000":
      //       price_value_output = "600k"
      //       break;
      //     default:
      //       price_value_output = "Precio"
      //   }
      //   target.html("US$" + price_value_output);
      // });
      //
      // $(".facet-price .dropdown-menu li #q_price_lteq").change(function() {
      //   var max_price_value = $(this).val();
      //   var target = $("#text-price-max");
      //   switch (max_price_value) {
      //     // Alquiler price range lteq
      //     case "750":
      //       max_price_value_output = "750"
      //       break;
      //     case "1000":
      //       max_price_value_output = "1,000"
      //       break;
      //     case "1250":
      //       max_price_value_output = "1,250"
      //       break;
      //     case "1500":
      //       max_price_value_output = "1,500"
      //       break;
      //     case "1750":
      //       max_price_value_output = "1,750"
      //       break;
      //     case "2000":
      //       max_price_value_output = "2,000"
      //       break;
      //     // Compra price range lteq
      //     case "100000":
      //       max_price_value_output = "100k"
      //       break;
      //     case "200000":
      //       max_price_value_output = "200k"
      //       break;
      //     case "300000":
      //       max_price_value_output = "300k"
      //       break;
      //     case "400000":
      //       max_price_value_output = "400k"
      //       break;
      //     case "500000":
      //       max_price_value_output = "500k"
      //       break;
      //     case "600000":
      //       max_price_value_output = "600k"
      //       break;
      //     default:
      //       max_price_value_output = "Precio"
      //     }
      //     target.html("- US$" + max_price_value_output);
      // });

      // $(".facet-price .dropdown-menu li #q_price_gteq").click(function() {
      //   var target = $("#text-price");
      //   if ($(this).val()) {
      //     target.html("$" + "(" + $(this).val() + ")");
      //   } else {
      //     target.html("Dormitorios");
      //   }
      // });


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


      // ... beds
      $('.dropdown-menu .facet-mobile-list #none').click(function() {
        $(".dropdown-menu .facet-mobile-list input[type='radio']#q_room_eq_").click();
      });
      $(".facet-bd .dropdown-menu li #none_main").click(function() {
        $(".facet-bd .dropdown-menu li input[type='radio']#none_button").click();
      });
      // 1 bed
      $('.dropdown-menu .facet-mobile-list #one').click(function() {
        $(".dropdown-menu .facet-mobile-list input[type='radio']#q_room_eq_1").click();
      });
      // $(".facet-bd .dropdown-menu li #one_main").click(function() {
      //   $(".facet-bd .dropdown-menu li input[type='radio']#one_button").click();
      // });
      // 2 beds
      $('.dropdown-menu .facet-mobile-list #two').click(function() {
        $(".dropdown-menu .facet-mobile-list input[type='radio']#q_room_eq_2").click();
      });
      // $(".facet-bd .dropdown-menu li #two_main").click(function() {
      //   $(".facet-bd .dropdown-menu li input[type='radio']#two_button").click();
      // });
      // 3 beds
      $('.dropdown-menu .facet-mobile-list #three').click(function() {
        $(".dropdown-menu .facet-mobile-list input[type='radio']#q_room_eq_3").click();
      });
      // $(".facet-bd .dropdown-menu li #three_main").click(function() {
      //   $(".facet-bd .dropdown-menu li input[type='radio']#three_button").click();
      // });
      // 4 beds
      $('.dropdown-menu .facet-mobile-list #four').click(function() {
        $(".dropdown-menu .facet-mobile-list input[type='radio']#q_room_eq_4").click();
      });
      // $(".facet-bd .dropdown-menu li #four_main").click(function() {
      //   $(".facet-bd .dropdown-menu li input[type='radio']#four_button").click();
      // });
      // 5 beds
      $('.dropdown-menu .facet-mobile-list #five').click(function() {
        $(".dropdown-menu .facet-mobile-list input[type='radio']#q_room_eq_5").click();
      });
      // $(".facet-bd .dropdown-menu li #five_main").click(function() {
      //   $(".facet-bd .dropdown-menu li input[type='radio']#five_button").click();
      // });

      // Bathrooms
      $('.dropdown-menu .facet-mobile-list #nonebath').click(function() {
        $(".dropdown-menu .facet-mobile-list input[type='radio']#q_bath_eq_").click();
      });
      $('.dropdown-menu .facet-mobile-list #1bath').click(function() {
        $(".dropdown-menu .facet-mobile-list input[type='radio']#q_bath_eq_1").click();
      });
      $('.dropdown-menu .facet-mobile-list #2bath').click(function() {
        $(".dropdown-menu .facet-mobile-list input[type='radio']#q_bath_eq_2").click();
      });
      $('.dropdown-menu .facet-mobile-list #3bath').click(function() {
        $(".dropdown-menu .facet-mobile-list input[type='radio']#q_bath_eq_3").click();
      });
      $('.dropdown-menu .facet-mobile-list #4bath').click(function() {
        $(".dropdown-menu .facet-mobile-list input[type='radio']#q_bath_eq_4").click();
      });
      $('.dropdown-menu .facet-mobile-list #5bath').click(function() {
        $(".dropdown-menu .facet-mobile-list input[type='radio']#q_bath_eq_5").click();
      });



      $('.dropdown-menu').click(function (event){
        event.stopPropagation();
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

// Fixed header search results
$(window).scroll(function(){
  var sticky = $('.affix-top'),
      scroll = $(window).scrollTop();

  if (scroll >= 114) sticky.addClass('affix'), $(".search-results").css( "margin-top", "68px" );
  else sticky.removeClass('affix'), $(".search-results").css("margin-top", "0px");
});
