class Event < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy 
  has_many :attendings
  has_many :attendees, through: :attendings, source: :user
  validates :name, :location, :state, :user_id, presence: true
  validate :date_cannot_be_in_the_past
  def date_cannot_be_in_the_past
  	errors.add(:date, "can't be in the past") if 
  		!date.blank? and date <Date.today
  end
end