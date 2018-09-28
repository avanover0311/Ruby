class Blog < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	has_many :owners, dependent: :destroy
	has_many :messages, through: :posts, dependent: :destroy
end
