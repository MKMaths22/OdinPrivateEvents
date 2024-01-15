class BookingsController < ApplicationController
  def create
    @booking = Booking.new
    @booking.attended_event_id = params[:event_id]
    @booking.attendee_id = current_user.id
    unless @booking.save
      flash[:alert] = "Booking failed to save"
    end
    redirect_to event_path(id: @booking.attended_event_id)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.delete
    redirect_to root_path
  end
end
