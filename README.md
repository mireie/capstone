# Musicalendar

#### A web application designed to help people who love live music find shows in their area and for local venues to easily showcase their upcoming shows.
Live Demo: https://musicalendar.herokuapp.com/


####  _By Michael Reiersgaard <Michael[dot]Reiersgaard[at]gmail[dot]com>_

## Technologies Used

1. Ruby v2.6.6
2. Rails v6.1.4
3. Leaflet
4. Geocoder
5. PostgreSQL
6. Faker
7. Devise
8. Kaminari
9. Bootstrap
10. Heroku

## Description

A web application dedicated to helping connect venues with people who love live music in Portland, OR. Musicalendar features full CRUD functionality for venues and their shows. Highlights include: 
* Automatic geocoding based on address input
* Dynamic map that will update pins based on number of shows and if there are all-ages shows. The pins grow larger as more shows are associated with a venue (to a limit), and if all-ages shows are present it will change the color of the pin.
* Image prioritization based on user uploads. A venue can have an image and each show can have an image. The prioritization allows a show's image to be displayed for a show, if present, otherwise it will fall back to the venue's image. If none is provided a fallback default image will be used.
* All-ages filtering is accessible via the menu.
* Import a list of venues by name with automatic address entry
* Database seeding

---

# Setup/Installation Requirements

## Intial Project Setup

* Ruby is required, download and install https://www.ruby-lang.org/en/documentation/installation/
* Bundler is required, install using the terminal with `gem install bundler`
* Ensure PostgreSQL is installed and correctly running on your local machine
* Create a directory to clone the public repository from GitHub using `git clone hhttps://github.com/mireie/musicalendar.git`
* Enter the root of the project directory and install all gems with `bundle install`

## Initializing the Database
- Update the `config/database.yml` file to match your PostgreSQL setup
- Initialize the database with `rake db:create` and initialize tables with `rake db:migrate`
    - If you encounter errors here, your `database.yml` file is likely not set up correctly and you skipped the previous step!
- Upload a CSV with each venue name on a separate row to `app/import/import-venues.csv`. An example is provided in this repo.
- Seed the database with products and reviews with the terminal command `rake db:seed`
- Venues will be created and an address will be attempted to be added to each based on the venue name in Portland, OR. Please review after import that addresses are correct.

## Running the Application
- To run the site on your local machine in the terminal run `rails s`
- Open your browser and navigate to `localhost:3000` (default configuration) 

---

## Known Bugs
* Please open a pull request if you have any issues!

## License

MIT License

Copyright (c) Michael Reiersgaard 2021

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

