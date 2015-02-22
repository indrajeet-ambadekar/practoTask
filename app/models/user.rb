class User < ActiveRecord::Base
	def self.create_with_omniauth(auth)
		# pry
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["name"]
			user.username = auth["info"]["nickname"]
			user.auth_token = auth["credentials"]["token"]
			user.auth_token_secret = auth["credentials"]["secret"]
		end
	end
end
