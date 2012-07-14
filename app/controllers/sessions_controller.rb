class SessionsController < ApplicationController
	def create
	  auth = request.env["omniauth.auth"]
	  provider = auth['provider']
	  uid = auth['uid']

	  user = User.where(:provider => provider, :uid => uid).first

	  user ||= User.create_with_omniauth(auth)
	  session[:user_id] = user.id
	  redirect_to root_url, :notice => "Signed in!"
	end

	def destroy
		reset_session
		redirect_to root_url, :notice => "Signed out!"
	end	

	def new
		redirect_to '/auth/twitter'
	end

	def failure
		redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
	end
end