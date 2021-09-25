class Show < ApplicationRecord
  belongs_to :venue
  has_one_attached :show_img
  scope :upcoming, -> { where('showtime >?', Time.now) }
  scope :past, -> { where.not('showtime >?', Time.now) }

  def get_artists
    artists = [self.artist1, self.artist2, self.artist3, self.artist4]
    artists.reject!(&:empty?)
    artists.join(", ")
  end
end
