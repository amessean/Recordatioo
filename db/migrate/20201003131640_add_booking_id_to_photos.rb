class AddBookingIdToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :booking_id, :integer
  end
end
