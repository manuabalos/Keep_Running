// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
	
	jQuery(document).ready(function() {
	    $(".click-row-routes").on("click", function() {
	        window.document.location = $(this).data("href");
	    });
	});

	$("#route_location").addClass("form-control");


	$("#btn-addHistory").on("click", function() {
		this_url = window.location.href;
		$.ajax({
        	type: 'POST',
        	dataType: 'json',
        	url: this_url + "/history",
        	success: function(response) { console.log("Success ",response); },
        	error: function(response) { console.log("Error ",response); }

   		})

	});	
	
});