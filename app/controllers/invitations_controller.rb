class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new(allowed_invite_params)
    if @invitation.save
      redirect_to event_path(id: invited_event_id)
    else
      flash.now[:alert] = @invitation.errors.full_messages
      render event_path(id: invited_event_id), status: :unprocessable_entity
    end
  end

  def update
    @invitation = Invitation.find(params[:id])
    @invitation = @invitation.update(:declined => true)
    redirect_to event_path(id: invited_event_id)
  end

  private

  def allowed_invite_params
    params.require(:invitation).permit(:invited_event_id, :invitee_id)
  end
end
