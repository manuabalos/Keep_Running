class RoutesController < ApplicationController

	def index
		@routes = Route.all
	end

	def show
		@route = Route.find(params[:id])
		@waypoints = @route.waypoints

		respond_to do |format|
      		format.html # show.html.erb
      		format.json { render json: {:route => @route, :waypoints => @waypoints} }
    	end

	end

end
