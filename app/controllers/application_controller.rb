class ApplicationController < ActionController::Base
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	def signed_in?
		current_user
	end
	def login(user)
		session[:user_id] = user.id
	end
	def logout
		session[:user_id] = nil
	end
	helper_method :current_user,:signed_in?
end
