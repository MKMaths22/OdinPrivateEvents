class BookingsController < ApplicationController
  
  before_action :authenticate_invitation, only: [:create]

  def authenticate_invitation
    @event = Event.find(params[:event_id])
    unless current_user && current_user.invited_events.include?(@event)
      flash[:alert] = "You must be logged in and invited to attend an Event."
      redirect_to new_user_session_path
    end
  end
  
  def create
    @booking = Booking.new
    @booking.attended_event_id = params[:event_id]
    @booking.attendee_id = current_user.id
    unless @booking.save
      flash[:alert] = "Booking failed to save"
    end
    redirect_to event_path(id: @booking.attended_event_id)
  end

  # def destroy
  #  @booking = Booking.find(params[:id])
  #  @booking.delete
  #  redirect_to root_path
  # end
end
