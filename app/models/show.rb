class Show < ApplicationRecord
  belongs_to :venue
  has_one_attached :show_img
  scope :upcoming, -> { where('showtime >?', Time.now) }
  scope :past, -> { where.not('showtime >?', Time.now) }
end
