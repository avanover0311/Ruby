class Use < ActiveRecord::Base
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
end
