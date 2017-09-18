class User < ApplicationRecord
  has_many :ads

  extend Enumerize
  enumerize :role, in: [:guest, :user, :admin], default: :guest 

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable 

end
