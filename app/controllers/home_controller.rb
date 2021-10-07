class HomeController < ApplicationController
  def index
    @venues = Venue.all.includes([:venue_img_attachment])
    @shows = Show.order(:showtime).upcoming.includes([:show_img_attachment]).limit(25)
  end
end
