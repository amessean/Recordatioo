class Review < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :booking, optional: true
  end
