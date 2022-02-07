class SessionsController < ApplicationController
	def new

  	end

	def create
    	user = User.find_by_username(params[:session][:username])

    	if user && user.authenticate(params[:session][:password])
			login(user)
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
