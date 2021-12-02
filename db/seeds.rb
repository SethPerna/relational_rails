# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
City.destory_all
Venue.destroy_all
@city_1 = City.create!(name: "Denver", population: 750000, coastal: false)
@city_2 = City.create!(name: "DC", population: 750000, coastal: true)
@venue_1 = Venue.create!(name: "Cervantes", capacity: 1450, indoor: true, city_id: @city_1.id)
@venue_2 = Venue.create!(name: "Red Rocks", capacity: 9545, indoor: false, city_id: @city_1.id)
