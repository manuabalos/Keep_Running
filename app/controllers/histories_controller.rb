class HistoriesController < ApplicationController
	before_action :set_auth
	def index
		@user = User.find current_user.id
		@history = @user.routes
		@history_date = History.where("user_id = ?", current_user.id)
	end

		private
 	def set_auth
    	@auth = session[:omniauth] if session[:omniauth]
 	end


end
