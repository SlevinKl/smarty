class Event < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  before_validation :set_category
  CATEGORIES = %w[Sport Culture Voyage Autres]

  has_one_attached :document
  belongs_to :user
  validates :title, :venue, :starts_at, :address, :category, presence: true, if: -> { status == "after_ocr" }
  validates :category, inclusion: { in: CATEGORIES }, if: -> { status == "after_ocr" }

  private

  def set_category
    return if category.present?

    self.category = "Autres"
  end
end
