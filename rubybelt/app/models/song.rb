class Song < ActiveRecord::Base
  belongs_to :user
  has_many :plays, dependent: :destroy 
  has_many :users_added, through: :plays, source: :user
  validates :artist, :presence => { :minimum => 2, :allow_nil => true}, :confirmation => true
  validates :title, :user_id, presence: true
end
