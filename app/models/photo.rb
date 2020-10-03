class Photo < ApplicationRecord
  belongs_to :booking
  mount_uploader :image, ImageUploader
end
