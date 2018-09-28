class Group < ActiveRecord::Base
  belongs_to :user
  validates :description, presence: true
  has_many :joins, dependent: :destroy
  has_many :users, through: :joins
end
