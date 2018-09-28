class Owner < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :blog, dependent: :destroy
  has_many :comments, as: :commentable
end
