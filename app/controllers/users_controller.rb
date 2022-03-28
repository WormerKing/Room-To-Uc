class UsersController < ApplicationController
	before_action :select_user,only: %i[ show edit update destroy ]
	
	before_action only:%i[ edit update destroy ] do
		validate_permission!(select_user)
	end

	before_action only:%i[ show ] do
		if @user.nil?
			redirect_to("/")
		end
	end
	def new
		if signed_in?
			redirect_to(profile_path(current_user))
		end
		$new_user = User.new
	end

	def create
		$new_user = User.new(user_params)

		new_id = (User.last.id + 1 if User.last) || 1
		$new_user.id = new_id

		if $new_user.valid?
			redirect_to(verify_email_path)
		else
			render :new
		end
	end


	def verify_email
		@verify_code = rand(100000..999999)
		UserMailer.with(user:$new_user,code:@verify_code).send_verify_email.deliver_now
	end

	def verify_email_post
		if params[:verify_code] == @verify_code
			UserMailer.with(user:$new_user).welcome_email.deliver_now
			
			$new_user.save
			
			$new_user.update_column(:confirmed,true)
			login($new_user)
			
			redirect_to "/"
		else
			render "verify_email"
		end
	end

	def show
		render layout:"profile"
	end

	def edit
		render layout:"profile"
	end
	def destroy
		logout
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
