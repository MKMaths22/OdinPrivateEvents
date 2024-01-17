class AddDeclinedToInvitation < ActiveRecord::Migration[7.1]
  def change
    add_column :invitations, :declined, :boolean, :default => false
  end
end
