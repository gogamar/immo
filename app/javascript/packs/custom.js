$(function () {
  "use strict";

  $(window).on("load", function () {
    $("#preloader").delay(350).fadeOut("slow");
    $("body").delay(350).css({ overflow: "visible" });
  });

  /*---- Bottom To Top Scroll Script ---*/
  $(window).on("scroll", function () {
    var height = $(window).scrollTop();
    if (height > 100) {
      $("#back2Top").fadeIn();
    } else {
      $("#back2Top").fadeOut();
    }
  });

  $("#back2Top").on("click", function (event) {
    event.preventDefault();
    $("html, body").animate({ scrollTop: 0 }, "slow");
    return false;
  });


  // Script For Select Adult & Child Number
  $(function () {
    var guestAmount = $("#guestNo");

    $("#cnt-up").on("click", function () {
      guestAmount.val(Math.min(parseInt($("#guestNo").val()) + 1, 20));
    });
    $("#cnt-down").on("click", function () {
      guestAmount.val(Math.max(parseInt($("#guestNo").val()) - 1, 1));
    });
  });

  $(function () {
    var guestAmount = $("#kidsNo");

    $("#kcnt-up").on("click", function () {
      guestAmount.val(Math.min(parseInt($("#kidsNo").val()) + 1, 20));
    });
    $("#kcnt-down").on("click", function () {
      guestAmount.val(Math.max(parseInt($("#kidsNo").val()) - 1, 0));
    });
  });

  // // Check In & Check Out Daterange Script
  // $(function () {
  //   $('input[name="checkout"]').daterangepicker({
  //     singleDatePicker: true,
  //   });
  //   $('input[name="checkout"]').val("");
  //   $('input[name="checkout"]').attr("placeholder", "Check Out");
  // });
  // $(function () {
  //   $('input[name="checkin"]').daterangepicker({
  //     singleDatePicker: true,
  //   });
  //   $('input[name="checkin"]').val("");
  //   $('input[name="checkin"]').attr("placeholder", "Check In");
  // });

  // Compare Slide
  $(".csm-trigger").on("click", function () {
    $(".compare-slide-menu").toggleClass("active");
  });
  $(".compare-button").on("click", function () {
    $(".compare-slide-menu").addClass("active");
  });

  // // smart-textimonials
  // $("#smart-textimonials").slick({
  //   slidesToShow: 3,
  //   infinite: true,
  //   arrows: false,
  //   autoplay: true,
  //   responsive: [
  //     {
  //       breakpoint: 768,
  //       settings: {
  //         arrows: false,
  //         slidesToShow: 2,
  //       },
  //     },
  //     {
  //       breakpoint: 480,
  //       settings: {
  //         arrows: false,
  //         slidesToShow: 1,
  //       },
  //     },
  //   ],
  // });

  // // Property Slide
  // $(".property-slide").slick({
  //   slidesToShow: 3,
  //   arrows: false,
  //   dots: true,
  //   autoplay: true,
  //   responsive: [
  //     {
  //       breakpoint: 1024,
  //       settings: {
  //         arrows: false,
  //         slidesToShow: 2,
  //       },
  //     },
  //     {
  //       breakpoint: 600,
  //       settings: {
  //         arrows: false,
  //         slidesToShow: 1,
  //       },
  //     },
  //   ],
  // });

  // // location Slide
  // $(".location-slide").slick({
  //   slidesToShow: 4,
  //   dots: true,
  //   arrows: false,
  //   autoplay: true,
  //   responsive: [
  //     {
  //       breakpoint: 1024,
  //       settings: {
  //         arrows: false,
  //         slidesToShow: 3,
  //       },
  //     },
  //     {
  //       breakpoint: 600,
  //       settings: {
  //         arrows: false,
  //         slidesToShow: 1,
  //       },
  //     },
  //   ],
  // });

  // // Team Slide
  // $(".team-slide").slick({
  //   slidesToShow: 4,
  //   arrows: false,
  //   autoplay: true,
  //   dots: true,
  //   responsive: [
  //     {
  //       breakpoint: 1023,
  //       settings: {
  //         arrows: false,
  //         dots: true,
  //         slidesToShow: 3,
  //       },
  //     },
  //     {
  //       breakpoint: 768,
  //       settings: {
  //         arrows: false,
  //         slidesToShow: 2,
  //       },
  //     },
  //     {
  //       breakpoint: 480,
  //       settings: {
  //         arrows: false,
  //         slidesToShow: 1,
  //       },
  //     },
  //   ],
  // });

  // // Featured Slick Slider
  // $(".featured_slick_gallery-slide").slick({
  //   centerMode: true,
  //   infinite: true,
  //   centerPadding: "40px",
  //   slidesToShow: 2,
  //   responsive: [
  //     {
  //       breakpoint: 768,
  //       settings: {
  //         arrows: true,
  //         centerMode: true,
  //         centerPadding: "20px",
  //         slidesToShow: 3,
  //       },
  //     },
  //     {
  //       breakpoint: 480,
  //       settings: {
  //         arrows: false,
  //         centerMode: true,
  //         centerPadding: "20px",
  //         slidesToShow: 1,
  //       },
  //     },
  //   ],
  // });

  // // Slider
  // $(".clior").slick({
  //   slidesToShow: 1,
  //   slidesToScroll: 1,
  //   arrows: false,
  //   autoplay: true,
  //   fade: true,
  //   dots: true,
  //   autoplaySpeed: 4000,
  // });

  // // Range Slider Script
  // $(".js-range-slider").ionRangeSlider({
  //   type: "double",
  //   min: 0,
  //   max: 1000,
  //   from: 200,
  //   to: 500,
  //   grid: true,
  // });

  // // Select Bedrooms
  // $("#bedrooms").select2({
  //   placeholder: "Bedrooms",
  //   allowClear: true,
  // });

  // // Select Bathrooms
  // $("#bathrooms").select2({
  //   placeholder: "Bathrooms",
  //   allowClear: true,
  // });

  // // Select Property Types
  // $("#ptypes").select2({
  //   placeholder: "Mostrar tot",
  //   allowClear: true,
  // });

  // // Select Property Types
  // $("#status").select2({
  //   placeholder: "Mostrar tot",
  //   allowClear: true,
  // });

  // // specialisms
  // $("#shorty").select2({
  //   placeholder: "Mostrar tot",
  //   allowClear: true,
  // });

  // // Select Min price
  // $("#minprice").select2({
  //   placeholder: "No Min",
  //   allowClear: true,
  // });

  // // Select built
  // $("#built").select2({
  //   placeholder: "Year Built",
  //   allowClear: true,
  // });

  // // Select Max Price
  // $("#maxprice").select2({
  //   placeholder: "No Max",
  //   allowClear: true,
  // });

  // // Select Country
  // $("#country").select2({
  //   placeholder: "Country",
  //   allowClear: true,
  // });

  // // Select Town
  // $("#town").select2({
  //   placeholder: "City/Town",
  //   allowClear: true,
  // });

  // // Select Town
  // $("#location").select2({
  //   placeholder: "Shaow All",
  //   allowClear: true,
  // });

  // // Select Cities
  // $("#cities").select2({
  //   placeholder: "All Cities",
  //   allowClear: true,
  // });

  // // Select Status
  // $("#status").select2({
  //   placeholder: "Select Status",
  //   allowClear: true,
  // });

  // // Select Rooms
  // $("#rooms").select2({
  //   placeholder: "Choose Rooms",
  //   allowClear: true,
  // });

  // // Select Garage
  // $("#garage").select2({
  //   placeholder: "Choose Rooms",
  //   allowClear: true,
  // });

  // // Select Rooms
  // $("#bage").select2({
  //   placeholder: "Select An Option",
  //   allowClear: true,
  // });

  // // Home Slider
  // $(".home-slider").slick({
  //   centerMode: false,
  //   slidesToShow: 1,
  //   responsive: [
  //     {
  //       breakpoint: 768,
  //       settings: {
  //         arrows: true,
  //         slidesToShow: 1,
  //       },
  //     },
  //     {
  //       breakpoint: 480,
  //       settings: {
  //         arrows: false,
  //         slidesToShow: 1,
  //       },
  //     },
  //   ],
  // });

  // $(".click").slick({
  //   slidesToShow: 1,
  //   slidesToScroll: 1,
  //   autoplay: false,
  //   autoplaySpeed: 2000,
  // });

  // Advance Single Slider
  $(function () {
    // Card's slider
    var $carousel = $(".slider-for");

    $carousel
      .slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: true,
        adaptiveHeight: true,
        asNavFor: ".slider-nav",
      })
      .magnificPopup({
        type: "image",
        delegate: "a:not(.slick-cloned)",
        closeOnContentClick: false,
        tLoading: "Carregant...",
        mainClass: "mfp-zoom-in mfp-img-mobile",
        image: {
          verticalFit: true,
          tError: "<a href=\"%url%\">L'imatge #%curr%</a> no s'ha carregat.",
        },
        gallery: {
          enabled: true,
          navigateByImgClick: true,
          tCounter: '<span class="mfp-counter">%curr% из %total%</span>', // markup of counte
          preload: [0, 1], // Will preload 0 - before current, and 1 after the current image
        },
        zoom: {
          enabled: true,
          duration: 300,
        },
        removalDelay: 300, //delay removal by X to allow out-animation
        callbacks: {
          open: function () {
            //overwrite default prev + next function. Add timeout for css3 crossfade animation
            $.magnificPopup.instance.next = function () {
              var self = this;
              self.wrap.removeClass("mfp-image-loaded");
              setTimeout(function () {
                $.magnificPopup.proto.next.call(self);
              }, 120);
            };
            $.magnificPopup.instance.prev = function () {
              var self = this;
              self.wrap.removeClass("mfp-image-loaded");
              setTimeout(function () {
                $.magnificPopup.proto.prev.call(self);
              }, 120);
            };
            var current = $carousel.slick("slickCurrentSlide");
            $carousel.magnificPopup("goTo", current);
          },
          imageLoadComplete: function () {
            var self = this;
            setTimeout(function () {
              self.wrap.addClass("mfp-image-loaded");
            }, 16);
          },
          beforeClose: function () {
            $carousel.slick("slickGoTo", parseInt(this.index));
          },
        },
      });
    $(".slider-nav").slick({
      slidesToShow: 6,
      slidesToScroll: 1,
      asNavFor: ".slider-for",
      dots: false,
      centerMode: false,
      focusOnSelect: true,
    });
  });

  // // Featured Slick Slider
  // $(".featured-slick-slide").slick({
  //   centerMode: true,
  //   centerPadding: "80px",
  //   slidesToShow: 2,
  //   responsive: [
  //     {
  //       breakpoint: 768,
  //       settings: {
  //         arrows: true,
  //         centerMode: true,
  //         centerPadding: "60px",
  //         slidesToShow: 2,
  //       },
  //     },
  //     {
  //       breakpoint: 480,
  //       settings: {
  //         arrows: false,
  //         centerMode: true,
  //         centerPadding: "40px",
  //         slidesToShow: 1,
  //       },
  //     },
  //   ],
  // });

  // // MagnificPopup
  // $("body").magnificPopup({
  //   type: "image",
  //   delegate: "a.mfp-gallery",
  //   fixedContentPos: true,
  //   fixedBgPos: true,
  //   overflowY: "auto",
  //   closeBtnInside: false,
  //   preloader: true,
  //   removalDelay: 0,
  //   mainClass: "mfp-fade",
  //   gallery: {
  //     enabled: true,
  //   },
  // });

  // fullwidth home slider
  function inlineCSS() {
    $(".home-slider .item").each(function () {
      var attrImageBG = $(this).attr("data-background-image");
      var attrColorBG = $(this).attr("data-background-color");
      if (attrImageBG !== undefined) {
        $(this).css("background-image", "url(" + attrImageBG + ")");
      }
      if (attrColorBG !== undefined) {
        $(this).css("background", "" + attrColorBG + "");
      }
    });
  }
  inlineCSS();

  // Search Radio
  function searchTypeButtons() {
    $('.property-search-type label.active input[type="radio"]').prop(
      "checked",
      true
    );
    var buttonWidth = $(".property-search-type label.active").width();
    var arrowDist = $(".property-search-type label.active").position();
    $(".property-search-type-arrow").css("left", arrowDist + buttonWidth / 2);
    $(".property-search-type label").on("change", function () {
      $('.property-search-type input[type="radio"]')
        .parent("label")
        .removeClass("active");
      $('.property-search-type input[type="radio"]:checked')
        .parent("label")
        .addClass("active");
      var buttonWidth = $(".property-search-type label.active").width();
      var arrowDist = $(".property-search-type label.active").position().left;
      $(".property-search-type-arrow").css({
        left: arrowDist + buttonWidth / 1.7,
        transition: "left 0.4s cubic-bezier(.95,-.41,.19,1.44)",
      });
    });
  }
  if ($(".hero-banner").length) {
    searchTypeButtons();
    $(window).on("load resize", function () {
      searchTypeButtons();
    });
  }
});
