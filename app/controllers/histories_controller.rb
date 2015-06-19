class HistoriesController < ApplicationController
	before_action :set_auth
	def index
		if current_user
			@user = User.find current_user.id
			@histories = @user.histories.order(created_at: :desc).limit(10)
			@average = History.averageDifficulty(@user)
			@routesCompleted = History.totalRoutesCompleted(@user)
		else
			redirect_to root_path
		end
	end

		private
 	def set_auth
    	@auth = session[:omniauth] if session[:omniauth]
 	end


end
