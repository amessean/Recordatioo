class AddPhoneNumberToGuests < ActiveRecord::Migration[6.0]
  def change
    add_column :guests, :phone_number, :string
  end
end
