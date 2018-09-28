class User < ActiveRecord::Base
	validates :first_name, :last_name, :email_address, :age, presence: true
	validates :first_name, :last_name, length: { minimum: 2}
	validates :age, numericality: { only_integer: true, greater_than: 150}
end
