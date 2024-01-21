class InvitationsController < ApplicationController
  
  before_action :authenticate_creator, only: [:create]
  before_action :authenticate_invitee, only: [:update]

  def authenticate_creator
    event = Event.find(params[:invited_event_id])
    unless current_user && current_user == event.creator
      flash[:alert] = 'You must be logged in as the Event creator to make an Invitation.'
      redirect_to new_user_session_path
    end
  end

  def authenticate_invitee
    event = Event.find(params[:invited_event_id])
    invitee = User.find(params[:invitee_id])
    unless current_user && event.invitees.include?(current_user)
      flash[:alert] = 'You must be logged in and invited to this Event to decline an Invitation.'
      redirect_to new_user_session_path
    end
  end
  
  def create
    @invitation = Invitation.new(allowed_invite_params)
    if @invitation.save
      redirect_to event_path(id: params[:invited_event_id])
    else
      flash.now[:alert] = @invitation.errors.full_messages
      render event_path(id: params[:invited_event_id]), status: :unprocessable_entity
    end
  end

  def update
    @invitation = Invitation.find(params[:id])
    @invitation.update(:declined => true)
    redirect_to event_path(id: @invitation.invited_event_id)
  end

  private

  def allowed_invite_params
    params.permit(:invited_event_id, :invitee_id)
  end
end
