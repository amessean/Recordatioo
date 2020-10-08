class AddPictureToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :picture, :string
  end
end
