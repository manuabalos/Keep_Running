class HistoriesController < ApplicationController
	before_action :set_auth
	def index
		@history = History.where("user_id = ?", current_user.id)
		binding.pry
	
	end

		private
 	def set_auth
    	@auth = session[:omniauth] if session[:omniauth]
 	end
end
