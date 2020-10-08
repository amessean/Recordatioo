class AddBookingIdToGuests < ActiveRecord::Migration[6.0]
  def change
    add_column :guests, :booking_id, :integer
  end
end
