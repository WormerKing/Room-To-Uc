class ApiUser < ApplicationRecord
	has_secure_password

	validates_presence_of :username,:password,:email

	validates :email,email:true

	validates :username,uniqueness:{case_sensitive:false}
end
