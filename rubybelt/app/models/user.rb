class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :last_name, :email, :password, presence: true
  has_many :songs 
  has_many :plays
  has_many :songs_added, through: :plays, source: :songs 
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
  validates :password, :presence => { :minimum => 8, :allow_nil => true}, :confirmation => true
end
