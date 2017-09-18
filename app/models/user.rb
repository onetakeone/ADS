class User < ApplicationRecord
  extend Enumerize
  enumerize :role, in: [:guest, :user, :admin], default: :guest 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
