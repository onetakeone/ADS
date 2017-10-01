class Picture < ApplicationRecord
  belongs_to :ad, optional: true 
  mount_uploader :image_src, ImageUploader
end
