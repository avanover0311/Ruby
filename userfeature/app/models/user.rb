class User < ActiveRecord::Base
	validates :name, :email, :password, :password_confirm, presence: true, length: {minimum: 5}, uniqueness: true
end
