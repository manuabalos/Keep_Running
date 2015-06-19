class LaddersController < ApplicationController
	before_action :set_auth

	def index
		if current_user
			@toprunner = User.order(level: :desc, experience: :desc).first
			@runners = User.all.order(level: :desc, experience: :desc)

			@topLeague = Ladder.getLeagues(1)
			@rankLeagues = Ladder.getLeagues("all")
		else
			redirect_to root_path
		end
	end

	private
 	def set_auth
    	@auth = session[:omniauth] if session[:omniauth]
 	end
end
