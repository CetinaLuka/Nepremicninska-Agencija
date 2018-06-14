
$(document).ready(function(){
	"use strict";

	var window_width 	 = $(window).width(),
	window_height 		 = window.innerHeight,
	header_height 		 = $(".default-header").height(),
	header_height_static = $(".site-header.static").outerHeight(),
	fitscreen 			 = window_height - header_height;


	$(".fullscreen").css("height", window_height)
	$(".fitscreen").css("height", fitscreen);

  //-------- Active Sticky Js ----------//
     $(".default-header").sticky({topSpacing:0});


  //------- Active Nice Select --------//
     if(document.getElementById("default-select")){
          $('select').niceSelect();
    };
    if(document.getElementById("vrsta_hise")){
        $('select').niceSelect();
    };
    if(document.getElementById("vrsta_posesti")){
        $('select').niceSelect();
    };
    if(document.getElementById("property")){
          $('select').niceSelect();
    };
    if(document.getElementsByClassName("isci")){
        $('select').niceSelect();
    };

    $('.img-pop-up').magnificPopup({
        type: 'image',
        gallery:{
        enabled:true
        }
    });



  $(".navbar-nav li a[href^='#']").on('click', function(event) {
    var target = this.hash;

    event.preventDefault();

    var navOffset = $('#navbar').height();

    return $('html, body').animate({
      scrollTop: $(this.hash).offset().top-70 - navOffset
    }, 600, function() {
      return window.history.pushState(null, null, target);
    });
  });

  // $('.navbar-nav>li>a').on('click', function(){
  //     $('.navbar-collapse').collapse('hide');
  // });



      // -------   Mail Send ajax

         $(document).ready(function() {
            var form = $('#booking'); // contact form
            var submit = $('.submit-btn'); // submit button
            var alert = $('.alert-msg'); // alert div for show alert message

            // form submit event
            form.on('submit', function(e) {
                e.preventDefault(); // prevent default form submit

                $.ajax({
                    url: 'booking.php', // form action url
                    type: 'POST', // form submit method get/post
                    dataType: 'html', // request type html/json/xml
                    data: form.serialize(), // serialize form data
                    beforeSend: function() {
                        alert.fadeOut();
                        submit.html('Sending....'); // change submit button text
                    },
                    success: function(data) {
                        alert.html(data).fadeIn(); // fade in response data
                        form.trigger('reset'); // reset form
                        submit.attr("style", "display: none !important"); // reset submit button text
                    },
                    error: function(e) {
                        console.log(e)
                    }
                });
            });
        });




       //  Start Google map

            // When the window has finished loading create our google map below


          $(document).ready(function() {
              $('#mc_embed_signup').find('form').ajaxChimp();
          });




              $("#range").ionRangeSlider({
                  hide_min_max: true,
                  keyboard: true,
                  min: 0,
                  max: 500000,
                  from: 20000,
                  to: 200000,
                  type: 'double',
                  step: 1,
                  prefix: "€",
                  grid: true
              });
              $("#range2").ionRangeSlider({
                  hide_min_max: true,
                  keyboard: true,
                  min: 0,
                  max: 500,
                  from: 100,
                  to: 400,
                  type: 'double',
                  step: 1,
                  prefix: "",
                  grid: true
              });
                $("#range3").ionRangeSlider({
                    hide_min_max: true,
                    keyboard: true,
                    min: 0,
                    max: 500000,
                    from: 20000,
                    to: 200000,
                    type: 'double',
                    step: 1,
                    prefix: "€",
                    grid: true
                });
                $("#range4").ionRangeSlider({
                hide_min_max: true,
                    keyboard: true,
                    min: 0,
                    max: 3000,
                    from: 250,
                    to: 1500,
                    type: 'double',
                    step: 1,
                    prefix: "",
                    grid: true
                });
                $("#range5").ionRangeSlider({
                    hide_min_max: true,
                    keyboard: true,
                    min: 0,
                    max: 500,
                    from: 100,
                    to: 400,
                    type: 'double',
                    step: 1,
                    prefix: "",
                    grid: true
                });
                $("#range6").ionRangeSlider({
                    hide_min_max: true,
                    keyboard: true,
                    min: 0,
                    max: 500000,
                    from: 20000,
                    to: 200000,
                    type: 'double',
                    step: 1,
                    prefix: "€",
                    grid: true
                });
                $("#range7").ionRangeSlider({
                    hide_min_max: true,
                    keyboard: true,
                    min: 0,
                    max: 10000,
                    from: 500,
                    to: 5000,
                    type: 'double',
                    step: 1,
                    prefix: "",
                    grid: true
                });
    });


function menjavaIskanja(){
    if(document.getElementById("tip_nepr").value==1){
        document.getElementById("iskanjeStanovanje").style.display="block";
        document.getElementById("iskanjeHisa").style.display="none";
        document.getElementById("iskanjePosest").style.display="none";

    }
    else if(document.getElementById("tip_nepr").value==2){
        document.getElementById("iskanjeStanovanje").style.display="none";
        document.getElementById("iskanjeHisa").style.display="block";
        document.getElementById("iskanjePosest").style.display="none";
    }
    else if(document.getElementById("tip_nepr").value==3){
        document.getElementById("iskanjeStanovanje").style.display="none";
        document.getElementById("iskanjeHisa").style.display="none";
        document.getElementById("iskanjePosest").style.display="block";
    }
}