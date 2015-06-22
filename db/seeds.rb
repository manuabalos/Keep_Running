# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	User.create(provider: "facebook", uid: "101653370178209", name: "Betty Alalfcha Valtchano", level: 3, experience: 75, photo: "http://graph.facebook.com/101653370178209/picture?type=large")
	User.create(provider: "facebook", uid: "100009988771867", name: "Rick Amiihh Goldman", level: 5, experience: 100, photo: "http://graph.facebook.com/100009988771867/picture?type=large")
	User.create(provider: "facebook", uid: "112539772415669", name: "Karen Amighi Zamore", level: 6, experience: 400, photo: "http://graph.facebook.com/112539772415669/picture?type=large")
	User.create(provider: "facebook", uid: "1420633874928552", name: "Dave Amide Lauman", level: 6, experience: 200, photo: "http://graph.facebook.com/1420633874928552/picture?type=large")
	User.create(provider: "facebook", uid: "129466917384483", name: "James Chrarrisom Gutier", level: 8, experience: 700, photo: "http://graph.facebook.com/129466917384483/picture?type=large")
	User.create(provider: "facebook", uid: "100009893824741", name: "Julyan Amihi Green", level: 2, experience: 800, photo: "http://graph.facebook.com/100009893824741/picture?type=large")
	User.create(provider: "facebook", uid: "100009536628671", name: "Jhoan Amiec Laver", level: 3, experience: 300, photo: "http://graph.facebook.com/100009536628671/picture?type=large")
	User.create(provider: "facebook", uid: "100009455212833", name: "Will Amid Letuchy", level: 2, experience: 10, photo: "http://graph.facebook.com/100009455212833/picture?type=large")
	User.create(provider: "facebook", uid: "100009418134866", name: "David Amidaha Martina", level: 45, experience: 20, photo: "http://graph.facebook.com/100009418134866/picture?type=large")
	User.create(provider: "facebook", uid: "102698066740878", name: "Tom Alak Chang", level: 34, experience: 50, photo: "http://graph.facebook.com/102698066740878/picture?type=large")
	User.create(provider: "facebook", uid: "100009660163985", name: "Barbara Amiffja Trum", level: 65, experience: 90, photo: "http://graph.facebook.com/100009660163985/picture?type=large")
	User.create(provider: "facebook", uid: "100009525409143", name: "Elissa Amie Yangsky", level: 77, experience: 350, photo: "http://graph.facebook.com/1412803979047102/picture?type=large")
	User.create(provider: "facebook", uid: "100009471352002", name: "Donna Gacebkb Bower", level: 21, experience: 250, photo: "http://graph.facebook.com/100009471352002/picture?type=large")
	User.create(provider: "facebook", uid: "100009966812591", name: "Nancy Afhabeia Dingle", level: 18, experience: 650, photo: "http://graph.facebook.com/103980803277480/picture?type=large")
	User.create(provider: "facebook", uid: "100009615044966", name: "Harry Mifae Sharpe", level: 19, experience: 550, photo: "http://graph.facebook.com/1404783126518842/picture?type=large")

	User.create(provider: "facebook", uid: "494404870709758", name: "Manuel Ábalos Serrano", level: 19, experience: 550, photo: "http://graph.facebook.com/494404870709758/picture?type=large")


	Route.create( name: "Parque del Retiro", description: "Recorrido por la zona exterior del parque del Retiro.",
				  location: "Madrid", difficulty: "Intermedia", distance: "5 Km",latitude: 40.416100, longitude: -3.684284,
				  origin_lat: 40.421429, origin_lng: -3.680189,
				  destination_lat: 40.421429, destination_lng: -3.680189)

	Waypoint.create( route_id: 1, latitude: 40.416015, longitude: -3.679990)
	Waypoint.create( route_id: 1, latitude: 40.410056, longitude: -3.680038)
	Waypoint.create( route_id: 1, latitude: 40.409868, longitude: -3.687838)
	Waypoint.create( route_id: 1, latitude: 40.419230, longitude: -3.688471)
	Waypoint.create( route_id: 1, latitude: 40.421059, longitude: -3.682410)

	# ================================================================================================= 

	Route.create( name: "Parque del Canal", description: "Recorrido por la zona exterior del parque del Canal.",
				  location: "Madrid", difficulty: "Principiantes", distance: "4 Km",latitude: 40.443223, longitude: -3.707657,
				  origin_lat: 40.444143, origin_lng: -3.709544,
				  destination_lat: 40.444143, destination_lng: -3.709544)

	Waypoint.create( route_id: 2, latitude: 40.444988, longitude: -3.707009)
	Waypoint.create( route_id: 2, latitude: 40.442142, longitude: -3.705201)
	Waypoint.create( route_id: 2, latitude: 40.441227, longitude: -3.707658)

	# ================================================================================================= 

	Route.create( name: "Poligono Industrial", description: "Recorrido por la zona del poligono industrial y el barrio La Paz.",
				  location: "Linares", difficulty: "Dificil", distance: "12 Km",latitude: 38.088114, longitude: -3.639998,
				  origin_lat: 38.088114, origin_lng: -3.639998,
				  destination_lat: 38.088114, destination_lng: -3.639998)

	Waypoint.create( route_id: 3, latitude: 38.088185, longitude: -3.663198)
	Waypoint.create( route_id: 3, latitude: 38.086173, longitude: -3.652546)
	Waypoint.create( route_id: 3, latitude: 38.085855, longitude: -3.640502)
	Waypoint.create( route_id: 3, latitude: 38.085855, longitude: -3.640502)
	Waypoint.create( route_id: 3, latitude: 38.082215, longitude: -3.616808)
	Waypoint.create( route_id: 3, latitude: 38.088202, longitude: -3.625327)

	# =================================================================================================

	Route.create( name: "Zona Verde", description: "Recorrido por la zona del paseo de Linares y la Zona Verde.",
				  location: "Linares", difficulty: "Intermedia", distance: "10 Km",latitude: 38.098376, longitude: -3.632338,
				  origin_lat: 38.098376, origin_lng: -3.632338,
				  destination_lat: 38.098570, destination_lng: -3.632649)

	Waypoint.create( route_id: 4, latitude: 38.130495, longitude: -3.611598)
	Waypoint.create( route_id: 4, latitude: 38.126405, longitude: -3.616785)

    # ================================================================================================= 

	Route.create( name: "Templo de Debod", description: "Recorrido por la zona del paseo Pintor Rosales y el templo de Debod.",
				  location: "Madrid", difficulty: "Principiantes", distance: "5 Km",latitude: 40.432529, longitude: -3.725233,
				  origin_lat: 40.432529, origin_lng: -3.725233,
				  destination_lat: 40.432529, destination_lng: -3.725233)

	Waypoint.create( route_id: 5, latitude: 40.422650, longitude: -3.716472)
	Waypoint.create( route_id: 5, latitude: 40.424624, longitude: -3.719148)

	# ================================================================================================= 

	Route.create( name: "Paseo Marítimo", description: "Recorrido por el paseo marítimo.",
				  location: "Barcelona", difficulty: "Principiantes", distance: "7.5 Km",latitude: 41.380827, longitude: 2.183155,
				  origin_lat: 41.380827, origin_lng: 2.183155,
				  destination_lat: 41.406231, destination_lng: 2.219226)

	#Waypoint.create( route_id: 6, latitude: 41.383061, longitude: 2.188505)
	# =================================================================================================



