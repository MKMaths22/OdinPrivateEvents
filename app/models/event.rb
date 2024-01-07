class Event < ApplicationRecord
  validates :location, presence: true
  validates :date, presence: true
end
