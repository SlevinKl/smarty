class Event < ApplicationRecord
  CATEGORIES = %w[Sport Culture Voyage Autres]
  has_one_attached :document
  belongs_to :user
  validates :title, :venue, :starts_at, :address, :category, :latitude, :longitude, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
