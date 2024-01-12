class BookingsController < ApplicationController
  def create
    @booking = Booking.new
    @booking.attended_event_id = params[:event_id]
    @booking.attendee_id = current_user.id
    @booking.save
    redirect_to root_path
  end

  def destroy
  end
end
