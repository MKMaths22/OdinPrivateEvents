class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    # @event = Event.new(allowed_event_params)
    # @event[:creator_id] = current_user[:id]

    @event = current_user.events.build(attributes = allowed_event_params)

    if @event.save
      redirect_to root_path
    else
      flash.now[:alert] = @event.errors.full_messages
      render 'new', status: :unprocessable_entity
    end
  end

  private 

  def allowed_event_params
    params.require(:event).permit(:location, :date)
  end
end
