class Event < ApplicationRecord
  validates :location, presence: true
  validates :date, presence: true
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
end
