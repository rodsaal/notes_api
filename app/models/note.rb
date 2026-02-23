class Note < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }

  scope :recent, -> { order(created_at: :desc) }
end