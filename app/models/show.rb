class Show < ApplicationRecord
  belongs_to :venue
  has_one_attached :show_img
  scope :upcoming, -> { where('showtime >?', Time.now).order('showtime') }
  scope :past, -> { where.not('showtime >?', Time.now).order('showtime') }
  scope :all_ages, -> { where(all_ages: true) }


  def get_artists
    artists = [self.artist1, self.artist2, self.artist3, self.artist4]
    artists.reject!(&:empty?)
    artists.join(", ")
  end
end
