class Friendship < ActiveRecord::Base
	belongs_to :friended, foreign_key: :friended_id, class_name: "User"
	belongs_to :friended_by, foreign_key: :friended_by_id, class_name: "User"

end
