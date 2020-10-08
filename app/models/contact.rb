class Contact < ApplicationRecord
  belongs_to :user, optional: true
  validates :email, :name, :phone_number, presence: true
  has_one_attached :picture
end
