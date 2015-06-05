class RoutesController < ApplicationController
	before_action :require_user, only: [:index, :show]
	def index
		@routes = Route.all.order(difficulty: :desc)
		@locations = Route.select(:location).uniq.map{|route| route.location}
		@routesLocation = Route.new
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
