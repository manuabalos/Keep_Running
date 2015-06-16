// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
	// -- Routes/index.html.erb	
	$(".click-row-routes").on("click", function() {
	    window.document.location = $(this).data("href");
	});
	
	// -- Routes/index.html.erb
	$("#route_location").addClass("form-control");

	// -- Routes/show.hmtml.erb
	$("#btn-addHistory").on("click", function() {
		this_url = window.location.href;
		$.ajax({
        	type: 'POST',
        	dataType: 'json',
        	url: this_url + "/history",
        	success: function(response) { $("#btn-addHistory").prop("disabled",true); console.log("Success ",response); },
        	error: function(response) { console.log("Error ",response); }
   		})
		$("#btn-addHistory").addClass("btn-success");
	});
});

// ================================================================================
//                        A P I   G O O G L E   M A P S 
// ================================================================================

	// ---------- Taking URL
	this_url = window.location.href;

	// ---------- ROUTES SPOTS ------------ //
	var latitude, longitude, origin_lat, origin_lng, destination_lat, detination_lng;
	var wp_latitude=[], wp_longitude=[];
	var route_description;
	// ---------- SHOW PATH ELEVATION ------ //
	var myPathElevation = []

	$.ajax({
        	type: 'GET',
        	dataType: 'json',
        	url: this_url,
        	success: function(data) { takingRoute(data); }
   	})

	function takingRoute(data)
	{
		route_description = data.route.description
		latitude = data.route.latitude;
		longitude = data.route.longitude;
		origin_lat = data.route.origin_lat;
		origin_lng = data.route.origin_lng;
		destination_lat = data.route.destination_lat;
		destination_lng = data.route.destination_lng;

		myPathElevation.push(new google.maps.LatLng(origin_lat, origin_lng))

		for(i=0;i<data.waypoints.length;i++)
		{
			wp_latitude.push(data.waypoints[i].latitude);
			wp_longitude.push(data.waypoints[i].longitude);
			myPathElevation.push(new google.maps.LatLng(data.waypoints[i].latitude, data.waypoints[i].longitude))
		}

		myPathElevation.push(new google.maps.LatLng(destination_lat, destination_lng))
		initialize();
	}

	var rendererOptions = {
	  draggable: true
	};
	var directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);;
	var directionsService = new google.maps.DirectionsService();
	var map;

	var elevator;
	var chart;
	var polyline;

	// Load the Visualization API and the columnchart package.
	google.load('visualization', '1', {packages: ['columnchart']});

	function initialize()
	{
		if(latitude)
		{
		// Añadimos LONGITUD y LATITUD de la posicion deseada.
		var myCenter=new google.maps.LatLng(latitude, longitude);

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
			content: route_description
			});

		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map,marker);
			});

		// Dibujar la ruta
		calcRoute();

		// Create an ElevationService.
		elevator = new google.maps.ElevationService();

		// Draw the path, using the Visualization API and the Elevation service.
		drawPath();
		}
	}

	function calcRoute() {
		var request = {
			origin: new google.maps.LatLng(origin_lat, origin_lng), // ORIGEN
			destination: new google.maps.LatLng(destination_lat, destination_lng), // DESTINO

			waypoints:[],

			travelMode: google.maps.TravelMode.WALKING
		};

		/* Preparamos el array de los puntos del recorrido */
		takingPaths=[];

			for(var i=0;i<wp_latitude.length;i++)
			{
				takingPaths.push({location: new google.maps.LatLng(wp_latitude[i], wp_longitude[i])});
			}

		request.waypoints = takingPaths;


			
		directionsService.route(request, function(response, status) {
		    if (status == google.maps.DirectionsStatus.OK) {
		      	directionsDisplay.setDirections(response);
		    }
		});
	}

	function drawPath() {

	  // Create a new chart in the elevation_chart DIV.
	  chart = new google.visualization.ColumnChart(document.getElementById('elevation_chart'));

	  // Create a PathElevationRequest object using this array.
	  // Ask for 256 samples along that path.
	  var pathRequest = {
	    'path': myPathElevation,
	    'samples': 500
	  }

	  // Initiate the path request.
	  elevator.getElevationAlongPath(pathRequest, plotElevation);
	}

	// Takes an array of ElevationResult objects, draws the path on the map
	// and plots the elevation profile on a Visualization API ColumnChart.
	function plotElevation(results, status) {
	  if (status != google.maps.ElevationStatus.OK) {
	    return;
	  }
	  var elevations = results;

	  // Extract the elevation samples from the returned results
	  // and store them in an array of LatLngs.
	  var elevationPath = [];
	  for (var i = 0; i < results.length; i++) {
	    elevationPath.push(elevations[i].location);
	  }

	  // Display a polyline of the elevation path.
	  var pathOptions = {
	    path: elevationPath,
	    strokeColor: '#0000CC',
	    opacity: 0.4,
	    map: map
	  }
	  polyline = new google.maps.Polyline(pathOptions);

	  // Extract the data from which to populate the chart.
	  // Because the samples are equidistant, the 'Sample'
	  // column here does double duty as distance along the
	  // X axis.
	  var data = new google.visualization.DataTable();
	  data.addColumn('string', 'Sample');
	  data.addColumn('number', 'Elevation');
	  for (var i = 0; i < results.length; i++) {
	    data.addRow(['', elevations[i].elevation]);
	  }

	  // Draw the chart using the data within its DIV.
	  document.getElementById('elevation_chart').style.display = 'block';
	  chart.draw(data, {
	    height: 150,
	    legend: 'none',
	    titleY: 'Elevation (m)',
	    vAxis: {minValue: 0}
	  });
	}

	google.maps.event.addDomListener(window, 'load', initialize);

// ================================================================================
//                       A P I  O P E N   W E A T H E R  M A P  
// ================================================================================

	$.ajax({
        type: 'GET',
        dataType: 'json',
        url: "http://api.openweathermap.org/data/2.5/forecast/weather?lat="+latitude+"&lon="+longitude+"&units=metric&lang=en",
        success: function(response) { takingWeather(response) },
        error: function(response) { console.log("Error ",response); }
   	})

   	function takingWeather(response)
   	{
   		dateNow = getDateTime();
   		
   		for(var i=0; i<response.list.length-1; i++)
   		{
   			dateCompleteResponse = response.list[i].dt_txt
   			dateResponse = dateCompleteResponse.split(" ");
   			if(dateResponse[0] == dateNow)
   			{
	 			console.log(response);
		   		console.log(response.list[i].dt_txt); // Fecha y hora 2015-06-18 12:00:00
		   		console.log(response.list[i].main.temp_min); // Temperatura minima
		   		console.log(response.list[i].main.temp_max); // Temperatura maxima
		   		console.log(response.list[i].rain['3h']); // Probabilidad de lluvia
		   		console.log(response.list[i].weather[0].icon); // Icono
		   		console.log(response.list[i].weather[0].description); // Descripcion
		   		console.log("----------------------------------------");  				
	   		}
   		}
   	}

   	function getDateTime() {
	    var now     = new Date(); 
	    var year    = now.getFullYear();
	    var month   = now.getMonth()+1; 
	    var day     = now.getDate();

	    if(month.toString().length == 1) {
	        var month = '0'+month;
	    }
	    if(day.toString().length == 1) {
	        var day = '0'+day;
	    }   
  
	    var dateTime = year+'-'+month+'-'+day;   
	    return dateTime;
	}

