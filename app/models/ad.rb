class Ad < ApplicationRecord
  belongs_to :user, optional: true
end
