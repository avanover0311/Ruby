class Message < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :post, dependent: :destroy
  has_many :comments, as: :commentable
end
