class User < ActiveRecord::Base
  validates :name, presence: true
  has_many :secrets
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes source: :secret
end
