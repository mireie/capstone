class Venue < ApplicationRecord
  has_many :shows
  has_one_attached :venue_img
  geocoded_by :address
  after_validation :geocode

  def address
    [self.street_address, self.city, self.state].join(', ')
  end

  def has_all_ages?
    self.shows.all_ages.upcoming.size > 0
  end
  
end