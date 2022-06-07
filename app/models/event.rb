class Event < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  CATEGORIES = %w[Sport Culture Voyage Autres]

  has_one_attached :document
  has_many :notifications, dependent: :destroy
  belongs_to :user
  # validates :title, :venue, :starts_at, :address, :category, presence: true
  # validates :category, inclusion: { in: CATEGORIES }
end
