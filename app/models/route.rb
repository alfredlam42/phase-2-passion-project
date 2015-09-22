class Route < ActiveRecord::Base
  belongs_to :creator, class_name:'User'
  has_many  :rsvps
  has_many :participants, through: :rsvps

  validates :start_location_address, presence: true
  validates :start_location_city, presence: true
  validates :start_location_state, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
end
