# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


	Route.create( name: "Parque del Retiro", description: "Recorrido por la zona exterior del parque del Retiro.",
				  location: "Madrid", difficulty: "Intermedia", latitude: 40.416100, longitude: -3.684284,
				  origin_lat: 40.421429, origin_lng: -3.680189,
				  destination_lat: 40.421429, destination_lng: -3.680189)

	Waypoint.create( route_id: 1, latitude: 40.416015, longitude: -3.679990)
	Waypoint.create( route_id: 1, latitude: 40.410056, longitude: -3.680038)
	Waypoint.create( route_id: 1, latitude: 40.409868, longitude: -3.687838)
	Waypoint.create( route_id: 1, latitude: 40.419230, longitude: -3.688471)
	Waypoint.create( route_id: 1, latitude: 40.421059, longitude: -3.682410)

	Route.create( name: "Parque del Canal", description: "Recorrido por la zona exterior del parque del Canal.",
				  location: "Madrid", difficulty: "Principiantes", latitude: 40.443223, longitude: -3.707657,
				  origin_lat: 40.444143, origin_lng: -3.709544,
				  destination_lat: 40.444143, destination_lng: -3.709544)

	Waypoint.create( route_id: 2, latitude: 40.444988, longitude: -3.707009)
	Waypoint.create( route_id: 2, latitude: 40.442142, longitude: -3.705201)
	Waypoint.create( route_id: 2, latitude: 40.441227, longitude: -3.707658)

	Route.create( name: "Poligono Industrial", description: "Recorrido por la zona del poligono industrial y el barrio La Paz.",
				  location: "Linares", difficulty: "Dificil", latitude: 38.088114, longitude: -3.639998,
				  origin_lat: 38.088114, origin_lng: -3.639998,
				  destination_lat: 38.088114, destination_lng: -3.639998)

	Waypoint.create( route_id: 3, latitude: 38.088185, longitude: -3.663198)
	Waypoint.create( route_id: 3, latitude: 38.086173, longitude: -3.652546)
	Waypoint.create( route_id: 3, latitude: 38.085855, longitude: -3.640502)
	Waypoint.create( route_id: 3, latitude: 38.085855, longitude: -3.640502)
	Waypoint.create( route_id: 3, latitude: 38.082215, longitude: -3.616808)
	Waypoint.create( route_id: 3, latitude: 38.088202, longitude: -3.625327)

