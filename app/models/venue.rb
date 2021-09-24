class Venue < ApplicationRecord
  has_many :shows
  has_one_attached :venue_img
  
end
