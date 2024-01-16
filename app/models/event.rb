class Event < ApplicationRecord
  validates :location, presence: true
  validates :date, presence: true
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :bookings, foreign_key: 'attended_event_id', dependent: :destroy
  has_many :attendees, :through => :bookings, dependent: :destroy
  default_scope {order('date')}

  scope :past, -> { where(date: ..(Time.now))}
  scope :future, -> { where(date: (Time.now)..)}
  
  # def self.past 
  #  where(date: ..(Time.now))
  # end

  # def self.future
  #  where(date: (Time.now)..)
  # end
end
