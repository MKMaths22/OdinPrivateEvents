class Booking < ApplicationRecord
  belongs_to :attended_event, :class_name => "Event"
  belongs_to :attendee, :class_name => "User"
  validates :attendee, uniqueness: { scope: :attended_event }
end
