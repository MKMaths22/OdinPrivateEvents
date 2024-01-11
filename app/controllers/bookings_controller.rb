class BookingsController < ApplicationController
  def create
    @booking = Booking.new(attended_event_id: = params[:id], attendee_id: = current_user.id)
  end

  def destroy
  end
end
