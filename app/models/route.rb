class Route < ActiveRecord::Base
  belongs_to :creator, class_name:'User'
  has_many  :events
  has_many :participants, through: :events

  validates :start_location, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
end
