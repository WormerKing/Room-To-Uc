class UsersController < ApplicationController
	before_action :select_user,only: %i[ show edit update destroy ]
	def new
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
		render layout:"profile"
	end

	def edit
		
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

		load_error_page unless @user
	end
	def load_error_page
		render file:"#{Rails.root}/public/404.html",status: :not_found
	end

end
