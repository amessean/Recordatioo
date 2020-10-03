class AddEndTimeToBookings < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :end_time, :string
  end
end
