// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

/* Materialize Scripts */
   
   $(document).ready(function() {
   	$(".dropdown-button").dropdown();
   	$('.button-collapse').sideNav();
   	$(".nav-wrapper li a[id^='$']").on('click', function(e) {
   	// prevent default anchor click behavior
   	e.preventDefault();

   	// store hash
   	var hash = this.hash;

   	// animate
   	$('html, body').animate({
     scrollTop: $(this.hash).offset().top
   	}, 800, function(){

       	// when done, add hash to url
       	// (default click behaviour)
       	window.location.hash = hash;
     	});
 	});
   });

