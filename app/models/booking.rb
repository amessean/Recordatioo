class Booking < ApplicationRecord
    belongs_to :user, optional: true
    has_many :reviews, dependent: :destroy
    CATEGORY = ["Diner", "Party", "Weekend", "Holiday"]
    has_many :photos, dependent: :destroy
end
