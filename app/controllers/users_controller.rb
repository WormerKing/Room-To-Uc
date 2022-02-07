class UsersController < ApplicationController
	before_action :select_user,only: %i[ show edit update destroy ]
	before_action only:%i[ edit update destroy ] do
		validate_permission!(select_user)
	end
	def new
		#if signed_in?
		#	redirect_to(profile_path(current_user))
		#end
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		new_id = (User.last.id + 1 if User.last) || 1
		@user.id = new_id

		if @user.save
			login(@user)
			flash[:notice] = "Kayıt işleminiz başarıyla gerçekleşti."
			redirect_to(profile_path(@user.username))
		else
			render :new
		end
	end

	def show
		if @user == current_user
			@data = params[:sayfa] if ["girdiğim-odalar","geçmiş","ödüllerim","cezalarım","hesap-durumum"].include? params[:sayfa]
		end
		render layout:"profile"
	end

	def edit
		render layout:"profile"
	end
	def destroy
		logout(@user)
		@user.destroy
		redirect_to register_path,notice:"Profiliniz başarıyla silindi"
	end
	
	private
	def user_params
		params.require(:user).permit!
	end
	def select_user
		@user = User.find_by_username(params[:id])
	end
end
