class AddContactIdToGuests < ActiveRecord::Migration[6.0]
  def change
    add_column :guests, :contact_id, :integer
  end
end
