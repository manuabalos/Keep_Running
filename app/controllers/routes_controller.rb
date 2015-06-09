class RoutesController < ApplicationController
	before_action :set_auth

	def index
		if current_user
			@routes = Route.all.order(difficulty: :desc)
			@locations = Route.select(:location).uniq.map{|route| route.location}
			@routesLocation = Route.new
		else
			redirect_to root_path
		end
	end

	def show
		if current_user
			@route = Route.find(params[:id])
			@waypoints = @route.waypoints

			respond_to do |format|
	      		format.html # show.html.erb
	      		format.json { render json: {:route => @route, :waypoints => @waypoints} }
	    	end
    	else
			redirect_to root_path
		end
	end

	def addHistory
		# Sumamos la experiencia
		@route = Route.find(params[:id])

			case @route.difficulty
				when "Principiantes"
				    current_user.experience = current_user.experience + 10
				when "Intermedia"
				  	current_user.experience = current_user.experience + 50
				when "Dificil"
					current_user.experience = current_user.experience + 100
			end

			
				
	    
	    current_user.save
		redirect_to routes_path(@route)
	end

	private
 	def set_auth
    	@auth = session[:omniauth] if session[:omniauth]
 	end

end
