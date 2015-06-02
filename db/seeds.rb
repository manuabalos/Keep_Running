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