class SessionsController < ApplicationController
	def new
		if signed_in?
			redirect_to(profile_path(current_user.username))
		end
  	end

	def create
    	user = User.find_by_username(params[:session][:username])

    	if user && user.authenticate(params[:session][:password])
			login(user)
			UserMailer.welcome(user:user).deliver_later
			redirect_to profile_path(user),notice:"Başarıyla giriş yapıldı"
		else
			flash[:error] = "Kullanıcı adı/parola hatalı"
			redirect_to login_path
		end
  	end

	def destroy
		logout
		redirect_to(login_path)
	end
end
