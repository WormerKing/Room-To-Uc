class ProfileFeaturesController < ApplicationController
	array = %i[ geçmiş ödüllerim]
	
	before_action :select_user,only: array
	
	before_action only: array do
		validate_permission! select_user
	end
	
	around_action :load_layout,only: array
	
	def geçmiş
	end
	def ödüllerim
	end

	private
	def select_user
		@user = User.find_by_username(params[:id])
	end
	def load_layout
		render layout:"profile"
	end
end
