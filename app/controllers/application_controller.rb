class ApplicationController < ActionController::Base
	rescue_from ActiveRecord::RecordNotFound,:with => :load_error_page
	private

	def find_user(**sözlük)
		User.find_by(sözlük)
	end

	def control_room(room)
		unless current_user.nil? || room.users.include?(current_user) || current_user.rooms.pluck(:online).include?(true)
			return true
		end
	end

	def sil(room)
		true unless room.users.include?(current_user)
	end

	def creator_account(room)
		true if room.creator == current_user
	end

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id] && User.exists?(session[:user_id])
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
	helper_method :control_room,:current_user,:signed_in?,:creator_account,:sil
end
