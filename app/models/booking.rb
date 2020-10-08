class Booking < ApplicationRecord
    belongs_to :user, optional: true
    has_many :reviews, dependent: :destroy
    has_many :guests, dependent: :destroy
    CATEGORY = ["Dinner", "Party", "Weekend", "Holidays"]
    has_many :photos, dependent: :destroy
    validates :start_time, :end_time, presence: true
end
