require "csv"

class Seed
  
  def self.begin
    puts "Cleaning up after the last mess, please wait a moment..."
    Show.destroy_all
    Venue.destroy_all
    
    seed = Seed.new
    seed.generate_venues
    seed.generate_shows
  end

  def generate_venues
    
    puts "Importing venues."
    filename = 'app/import/import-venues.csv'
    imported_venues = CSV.read(filename)
    imported_venues.each do |venue|
      if Geocoder.search("#{venue.first} Portland, OR")[0]
        gr = Geocoder.search("#{venue.first} Portland, OR")[0].data['address'] 
        Venue.create!(
          name: venue.first,
          street_address: "#{gr['house_number']} #{gr['road']} ",
          city: gr['city'],
          state: gr['state'],
          zip_code: gr['postcode'],
        )
      else 
        Venue.create!(
          name: venue.first
        )
      end
      puts Venue.last.name
    end
    puts "\n"
  end
  
  def generate_shows
    puts "\nGenerating shows at these venues:"
    @venues = Venue.all
    @venues.each do |venue|
      puts "\n-#{venue.name}:\n"
      rand(1..50).times do
        all_ages = "false"
        artist4 = ""
        if rand(3) == 1
          all_ages = "true"
          artist4 = Faker::Hipster.words(spaces_allowed: true).join(" ").titleize
        end
        name = Faker::Hipster.words(spaces_allowed: true)
        Show.create!(
          title: name.join(" ").titleize,
          artist1: Faker::Hipster.words(spaces_allowed: true).join(" ").titleize,
          artist2: Faker::Hipster.words(spaces_allowed: true).join(" ").titleize,
          artist3: Faker::Hipster.words(spaces_allowed: true).join(" ").titleize,
          artist4: artist4,
          details: Faker::Hipster.paragraph(random_sentences_to_add: 5),
          showtime: Faker::Time.between_dates(from: Date.today - 14, to: Date.today + 90, period: :evening),
          price: rand(0.00..100.00),
          all_ages: all_ages,
          url: "#{venue.website}/#{name.each{|word| word.gsub!(' ','-')}.join('-')}",
          venue_id: venue.id
        )
        print all_ages == 'true' ? "A" : "."
      end
    end
    puts "\nCreated #{Show.count} shows at #{Venue.count} venues."
  end
end

Seed.begin