class BookingsController < ApplicationController
  def create
    @booking = Booking.new
    puts params
    @booking.attended_event_id = params[:event_id]
    @booking.attendee_id = current_user.id
    p @booking
    if @booking.save
      puts 'booking has been saved'
    else
      puts 'saving failed'
    end
    redirect_to root_path
  end

  def destroy
  end
end
