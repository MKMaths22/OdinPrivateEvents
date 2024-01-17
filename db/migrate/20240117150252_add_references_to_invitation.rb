class AddReferencesToInvitation < ActiveRecord::Migration[7.1]
  def change
    add_reference :invitations, :invited_event, null: false, foreign_key: { to_table: :events }
    add_reference :invitations, :invitee, null: false, foreign_key: { to_table: :users }
  end
end
