class User < ActiveRecord::Base
  has_secure_password
  has_many :comments
  has_many :likes
  has_many :likes_added, through: :likes, source: :comments
  validates :name, :screen_name, :email, presence: true
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false }, format: {with: EMAIL_REGEX}
  validates :password, :presence => { :minimum => 8}
end
