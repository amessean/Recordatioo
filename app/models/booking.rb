class Booking < ApplicationRecord
    belongs_to :user, optional: true
    has_many :reviews, dependent: :destroy
    has_many :guest, dependent: :destroy
    CATEGORY = ["Dinner", "Party", "Weekend", "Holidays"]
    GUEST = []
      Booking.user.contacts.each do |contact|
        GUEST << contact.name
      end

    has_many :photos, dependent: :destroy
    validates :start_time, :end_time, presence: true
end
