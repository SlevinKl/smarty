class Event < ApplicationRecord
  CATEGORIES = %w[Sport Culture Voyage Autres]
  belongs_to :user
  validates :title, :venue, :starts_at, :address, :category, :latitude, :longitude, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
