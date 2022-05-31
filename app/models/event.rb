class Event < ApplicationRecord
  belongs_to :user
  validates :title, :venue, :starts_at, :address, :category, :latitude, :longitude, presence: true
end
