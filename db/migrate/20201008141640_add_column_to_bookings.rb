class AddColumnToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :guest, :string, array: true, default: []
  end
end
