class Ad < ApplicationRecord
  #extend SimplestStatus
  #statuses :draft, :new, :blocked, :verified, :published, :archived
  
  validates :title, presence: true, length: { maximum: 150}
  validates :body, presence: true, length: { maximum: 4000}
  
  mount_uploader :image, ImageUploader

  belongs_to :user, optional: true
  belongs_to :type 

  has_many :pictures, inverse_of: :ad, dependent: :destroy
  accepts_nested_attributes_for :pictures, reject_if: :all_blank, allow_destroy: true
end
