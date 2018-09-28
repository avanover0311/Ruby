class User < ActiveRecord::Base
	has_many :friendees, foreign_key: :friended_id, class_name: "Friendship"
	has_many :friends, through: :friendees, source: :friended_by

	has_many :frienders, foreign_key: :friended_by_id, class_name: "Friendship"
	has_many :friendships, through: :frienders, source: :friended
end
