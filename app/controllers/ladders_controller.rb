class LaddersController < ApplicationController
	before_action :set_auth

	def index
		@toprunners = User.all.order(level: :desc).limit(3)
		@runners = User.all.order(level: :desc)
	end

	private
 	def set_auth
    	@auth = session[:omniauth] if session[:omniauth]
 	end
end
