class User < ApplicationRecord

  validates :username, presence: true, uniqueness: true 
  validates :email, presence: true, uniqueness: true 
  
  has_many :ads 

  extend Enumerize
  enumerize :role, in: [:guest, :user, :admin], default: :guest  

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable 
  def role?(type)
     administrations.pluck(:role).include?(type.to_s)
  end
end
