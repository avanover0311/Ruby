class Dojo < ActiveRecord::Base
	validates :branch, :city, :state, :street, presence: true
	validates :state, length: { is: 2}
	has_many :students
end
