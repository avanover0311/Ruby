class Blog < ActiveRecord::Base
	validates :name, :description, presence: true
	belongs_to :post
end
