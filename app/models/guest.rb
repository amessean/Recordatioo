class Guest < ApplicationRecord
  belongs_to :booking
  belongs_to :contact
end
