class Trip < ActiveRecord::Base
  belongs_to :user
  validates :name, :location, :description, presence: true
  has_many :attends
  has_many :users, through: :attends
end
