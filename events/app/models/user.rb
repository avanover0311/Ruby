class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :last_name, :email, :location, :state, :password, presence: true
  has_many :events_joined, through: :attending, source: :events 
  has_many :attends 
  has_many :comments
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
  validates :password, :presence => { :minimum => 8, :allow_nil => true}, :confirmation => true
end
