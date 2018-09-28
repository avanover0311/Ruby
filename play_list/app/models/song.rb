class Song < ActiveRecord::Base
  belongs_to :user
  has_many :listens, dependent: :destroy 
  has_many :users, through: :listens
  validates :artist, :presence => { :minimum => 2, :allow_nil => true}, :confirmation => true
  validates :title, :user_id, presence: true
end
