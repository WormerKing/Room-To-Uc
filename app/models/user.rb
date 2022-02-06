class User < ApplicationRecord
	has_secure_password

	validates_presence_of :first_name,:last_name,:username,:role,:pubg_id,:email,:password_digest

	validates_uniqueness_of :username,:pubg_id,:email,case_sensitive:false
	
	validates :username,format:{with:/[a-z0-9A-Z_-]/},length:{minimum:4,maximum:12}
	validates_format_of :first_name,:last_name,with:/[a-z0-9A-Z]/

	validates :email,email:true
	
	validates :role,inclusion:{in:["janitor","player"]}

	validates :pubg_id,length:{is:10}
	def to_param
		username
	end
end
