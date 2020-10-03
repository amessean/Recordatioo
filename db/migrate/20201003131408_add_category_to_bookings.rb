class AddCategoryToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :category, :string
  end
end
