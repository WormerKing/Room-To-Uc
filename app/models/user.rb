class User < ApplicationRecord
	has_secure_password

	validates_presence_of :first_name,:last_name,:username,:role,:pubg_id,:email,:password_digest

	validates_uniqueness_of :username,:pubg_id,:email,case_sensitive:false
	
	validates :email,email:true
	
	validates :role,inclusion:{in:["janitor","player"]}

	validates :pubg_id,length:{is:10}
end
