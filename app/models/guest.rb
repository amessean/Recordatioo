class Guest < ApplicationRecord
  belongs_to :booking
  belongs_to :contact
  validates :email, :name, :phone_number, presence: true
end
