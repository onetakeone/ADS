# frozen_string_literal: true

#
class Ad < ApplicationRecord
  paginates_per 4

  # Validations, associatins.
  validates :title, presence: true, length: { maximum: 150 }
  validates :body, presence: true, length: { maximum: 4000 }

  belongs_to :user, optional: true
  belongs_to :type

  # Image uploads and nested forms.
  mount_uploader :image, ImageUploader

  has_many :pictures, inverse_of: :ad, dependent: :destroy
  accepts_nested_attributes_for :pictures,
                                reject_if: :all_blank, allow_destroy: true

  # State machine.
  state_machine :state, initial: :draft do
    event :create do
      transition draft: :new
    end

    event :deny do
      transition new: :denied
    end

    event :verify do
      transition new: :verified
    end

    event :kick do
      transition new: :deleted, verified: :deleted
    end

    event :publish do
      transition verified: :published
    end

    event :archieve do
      transition published: :archieved
    end

    event :resurrect do
      transition archieved: :draft
    end
  end

  # Search methods.
  include PgSearch
  pg_search_scope :search_engine, against: %i[title body],
                                  using: { tsearch: { prefix: true, any_word: true } }
  # pg_search_scope :search_type, against: [:type_id]

  scope :published, -> { where(state: 'published') }

  def self.search(search)
    search.nil? ? published : search && search == '' ? published : search_engine(search)
    # search.nil? ? published : search && search == '' ? published : where("to_tsvector('english', title || ' ' || body) @@ to_tsquery(?)", search)
  end

  def self.type_filter(type_filter)
    # type_filter.nil? ? all : search_type(type_filter)
    type_filter.nil? ? all : where(type_id: type_filter)
  end
end
