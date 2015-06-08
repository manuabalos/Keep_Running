class HomeController < ApplicationController
	before_action :set_auth
    
	def index
		if current_user
			redirect_to routes_path
		end
 	end

 	def profile
 	end

 	private
 	def set_auth
    	@auth = session[:omniauth] if session[:omniauth]
 	end
end
