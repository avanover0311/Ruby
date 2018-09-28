class User < ActiveRecord::Base
  has_secure_password
  before_save :rooty_tooty
  validates :name, :email, :password, presence: true
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
  has_many :secrets
  has_many :secrets_liked, through: :likes, source: :secret
  has_many :likes, dependent: :destroy
  def rooty_tooty
  	self.email.downcase!
  end
end
