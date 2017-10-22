# frozen_string_literal: true

#
class User < ApplicationRecord
  paginates_per 4

  validates :username,
            presence: true,
            uniqueness: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /[a-z0-9'.+_`-]*[a-z0-9'+_`-]+?[a-z0-9'+_`-]+[@]+[a-z0-9'.]+\.+[a-z0-9']+/ }

  has_many :ads, dependent: :destroy

  extend Enumerize
  enumerize :role, in: %i[guest user admin], default: :guest

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  def role?(type)
    administrations.pluck(:role).include?(type.to_s)
  end
end
