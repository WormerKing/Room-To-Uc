class UserMailer < ApplicationMailer
	default from: 'aferinwormer@protonmail.com'

	def send_verify_email()
		@user = params[:user]
		@code = params[:code]
		mail(to:@user.email, subject:"Room To Uc verify email")
	end

	def welcome_email
		@user = params[:user]
		mail(to:@user.email, subject:"Welcome Room To Uc official website")
	end
end
