class LaddersController < ApplicationController
	before_action :set_auth

	def index
		@toprunner = User.order(level: :desc, experience: :desc).first
		@runners = User.all.order(level: :desc, experience: :desc)
	end

	private
 	def set_auth
    	@auth = session[:omniauth] if session[:omniauth]
 	end
end
