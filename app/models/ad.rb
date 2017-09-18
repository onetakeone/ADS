class Ad < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :status
end
