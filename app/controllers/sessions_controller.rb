class SessionsController < ApplicationController
	def new
		
	end

	def create
		if request.env["omniauth.auth"]
			auth = request.env["omniauth.auth"]
			session[:omniauth] = auth.except('extra')
			user = SocialUser.sign_in_from_omniauth(auth)
			session[:user_id] = user.id
			redirect_to root_url, notice: "Signed in!"

		else
			@user = User.find_by_email(params[:session][:email])
			if @user && @user.authenticate(params[:session][:password])
				session[:user_id] = @user.id
				redirect_to '/'
			else
				redirect_to 'login'
			end 
		end
	end

	def destroy 
		session[:user_id] = nil
		if session[:omniauth]
			session[:omniauth] = nil
		end 
		redirect_to root_url, notice: "Signed out!" 
	end
end

