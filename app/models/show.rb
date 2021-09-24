class Show < ApplicationRecord
  belongs_to :venue
  has_one_attached :show_img
end
