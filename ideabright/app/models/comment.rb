class Comment < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true
  has_many :adds
  has_many :users, through: :adds
end
