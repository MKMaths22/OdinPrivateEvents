class AddDoubleIdToInvitations < ActiveRecord::Migration[7.1]
  def change
    add_index :invitations, [:invited_event_id, :invitee_id], unique: true
  end
end
