class EventsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]
  before_action :authenticate_creator, only: [:edit, :update, :destroy]

  def authenticate_user
    unless current_user
    flash[:alert] = 'You must be logged in to create an Event.'
    redirect_to new_user_session_path
    end
  end

  def authenticate_creator
    event = Event.find(params[:id])
    unless current_user == event.creator
      flash[:alert] = 'You must be logged in as the creator of the Event to perform this action.'
      redirect_to new_user_session_path
    end
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    # @event = Event.new(allowed_event_params)
    # @event[:creator_id] = current_user[:id]
    
    @event = current_user.events.build(attributes = allowed_event_params)

    if @event.save
      redirect_to event_path(id: @event.id)
    else
      flash.now[:alert] = @event.errors.full_messages
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(attributes = allowed_event_params)
      redirect_to event_path(id: @event.id)
    else
      flash.now[:alert] = @event.errors.full_messages
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to user_path(id: current_user.id)
  end

  private 

  def allowed_event_params
    params.require(:event).permit(:location, :date)
  end
end
