// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
	
	jQuery(document).ready(function($) {
	    $(".click-row-routes").click(function() {
	        window.document.location = $(this).data("href");
	    });
	});

	$("#route_location").addClass("form-control");
	
});