class ApplicationController < ActionController::Base
	rescue_from ActiveRecord::RecordNotFound,:with => :load_error_page
	private
	def control_room
		unless current_user.nil? || @room.users.include?(current_user) || current_user.rooms.pluck(:online).include?(true)
			return true
		end
	end
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
	def validate_permission!(user)
		unless current_user == user
			redirect_to "/"
		end
	end
	def load_error_page
		render file:"#{Rails.root}/public/404.html",status: :not_found
	end
	helper_method :control_room,:current_user,:signed_in?
end
