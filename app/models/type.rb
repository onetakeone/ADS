# frozen_string_literal: true

#
class Type < ApplicationRecord
  validates :ad_type,
            presence: true,
            uniqueness: true
  has_many :ads
end
