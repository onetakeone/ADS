class Ad < ApplicationRecord
  
  validates :title, presence: true, length: { maximum: 150}
  validates :body, presence: true, length: { maximum: 4000}
  
  mount_uploader :image, ImageUploader

  belongs_to :user, optional: true
  belongs_to :type 

  has_many :pictures, inverse_of: :ad, dependent: :destroy
  accepts_nested_attributes_for :pictures, reject_if: :all_blank, allow_destroy: true
     
  state_machine :state, :initial => :draft do
    state :create
    event :create do
      transition :draft => :new
    end  
  end

  state_machine :state, :initial => :new do
    state :deny
    state :delete
    state :verify  
    event :deny do
      transition :new => :denied
    end  

    event :verify do
      transition :new => :verified
    end 

     event :delete do
      transition :new => :deleted
    end
  end

  state_machine :state, :initial => :verified do
    state :publish
    state :delete
    state :archieve    
    event :publish do
      transition :verified => :published
    end 

    event :delete do
      transition :verified => :deleted
    end
  
    event :archieve do
      transition :published => :archieved
    end 
  end

  state_machine :state, :initial => :archieved do
    state :resurrect
    event :ressurect do
      transition :archieved => :draft
    end
  end
end

