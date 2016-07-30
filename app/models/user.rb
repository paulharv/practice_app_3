class User < ApplicationRecord
	attr_accessor :remember_token
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence:true
	validates :email, 
		presence: true, 
		length: {maximum:255}, 
		format: {with:VALID_EMAIL_REGEX},
		uniqueness: {case_sensitive:false}

	has_secure_password

	# this has to create remember_token and then save _digest version of it
	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(self.remember_token))
	end

	def forget
		update_attribute(:remember_digest, nil)
	end

	def authenticate_token(token)
		BCrypt::Password.new(self.remember_digest).is_password?(token)
	end

	class << self
		def new_token
			SecureRandom.urlsafe_base64
		end

		def digest(string)
			cost = ActiveModel::SecurePassword.min_cost ? 
				BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
			BCrypt::Password.create(string, cost: cost)
		end
	end
end
