class Booking < ApplicationRecord
    belongs_to :user, optional: true
    has_many :reviews, dependent: :destroy
    CATEGORY = ["Dinner", "Party", "Weekend", "Holidays"]
    has_many :photos, dependent: :destroy
    has_many :contacts
    validates :start_time, :end_time, presence: true
end
