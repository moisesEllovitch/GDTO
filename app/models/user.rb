class User < ActiveRecord::Base
	
	validates :email, presence: true
	validates :password, presence: true, length: {minimum: 5}
end
