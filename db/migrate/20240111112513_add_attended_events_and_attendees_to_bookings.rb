class AddAttendedEventsAndAttendeesToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :attended_event, null: false, foreign_key: { to_table: :events }
    add_reference :bookings, :attendee, null: false, foreign_key: { to_table: :users }
  end
end
