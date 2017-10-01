class Ad < ApplicationRecord
  paginates_per 10
  
  validates :title, presence: true, length: { maximum: 150} 
  validates :body, presence: true, length: { maximum: 4000} 
  
  mount_uploader :image, ImageUploader

  belongs_to :user, optional: true 
  belongs_to :type 

  has_many :pictures, inverse_of: :ad, dependent: :destroy 
  accepts_nested_attributes_for :pictures, reject_if: :all_blank, allow_destroy: true
     
  state_machine :state, :initial => :draft do
    event :create do
      transition :draft => :new
    end  
  
    event :deny do
      transition :new => :denied
    end  

    event :verify do
      transition :new => :verified
    end 

    event :kick do
      transition :new => :deleted, :verified => :deleted
    end
  
    event :publish do
      transition :verified => :published
    end 
     
    event :archieve do
      transition :published => :archieved
    end 
  
    event :resurrect do
      transition :archieved => :draft
    end
  end
end

