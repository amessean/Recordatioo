class RemoveGuestFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :guest, :string, array: true, default: []
  end
end
