class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, foreign_key: "creator_id", class_name: "Event", dependent: :destroy
  has_many :bookings, foreign_key: "attendee_id", dependent: :destroy
  has_many :attended_events, :through => :bookings, dependent: :destroy
  has_many :invitations, foreign_key: "invitee_id", dependent: :destroy
  has_many :invited_events, :through => :invitations, dependent: :destroy
  has_many :declined_events, ->{ where(invitations: { declined:true}) },:through => :invitations, source: :invited_event
  validates :name, presence: true
end
