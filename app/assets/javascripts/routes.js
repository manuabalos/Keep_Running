// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
	
	var rendererOptions = {
	  draggable: true
	};
	var directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);;
	var directionsService = new google.maps.DirectionsService();
	var map;

	var route_id = '<%= :id %>';
	console.log(route_id);


	 /*$.ajax({
        type: 'GET',
        dataType: 'json',
        url: 'http://localhost:3000/routes/'+route_id.val(),
        success: function(data) { populateSpots(data) }
    })*/

	// ------------------ GOOGLE MAP API ----------------------- //

	function initialize()
	{

		// Añadimos LONGITUD y LATITUD de la posicion deseada.
		var myCenter=new google.maps.LatLng(40.416100, -3.684284);

		var mapProp = {
			center:myCenter,
			zoom:15,
			mapTypeId:google.maps.MapTypeId.ROADMAP
			};

		var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
		directionsDisplay.setMap(map);

		// Añadimos una marca en el mapa
		var marker=new google.maps.Marker({
			position:myCenter,
			});

		marker.setMap(map);

		// Añadimos un comentario en la marca del mapa
		var infowindow = new google.maps.InfoWindow({
			content:"Hello World!"
			});

		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map,marker);
			});

		// Dibujar la ruta
		calcRoute();
	}

			
	function calcRoute() {

		var request = {
			origin: new google.maps.LatLng(40.421429, -3.680189), // ORIGEN
			destination: new google.maps.LatLng(40.421429, -3.680189), // DESTINO
			waypoints:[ {location: new google.maps.LatLng(40.416015, -3.679990)},
						{location: new google.maps.LatLng(40.410056, -3.680038)},
						{location: new google.maps.LatLng(40.409868, -3.687838)},
						{location: new google.maps.LatLng(40.419230, -3.688471)},
					    {location: new google.maps.LatLng(40.421059, -3.682410)}],
			travelMode: google.maps.TravelMode.WALKING
		};

		console.log(request);
			
		directionsService.route(request, function(response, status) {
		    if (status == google.maps.DirectionsStatus.OK) {
		      	directionsDisplay.setDirections(response);
		    }
		});
	}

	google.maps.event.addDomListener(window, 'load', initialize);
	
});