class Ad < ApplicationRecord
  #extend SimplestStatus
  #statuses :draft, :new, :blocked, :verified, :published, :archived
  
  mount_uploader :image, ImageUploader

  belongs_to :user, optional: true
  belongs_to :type 
end
