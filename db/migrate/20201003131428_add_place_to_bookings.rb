class AddPlaceToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :place, :string
  end
end
