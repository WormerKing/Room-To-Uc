class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		new_id = User.last.id + 1 if User.last

		new_id ||= 1

		@user = User.new(user_params)
		@user.id = new_id
		if @user.save
			flash[:notice] = "Kayıt işleminiz başarıyla gerçekleşti."
			redirect_to @user
		else
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
	end

	private
	def user_params
		params.require(:user).permit!
	end
end
