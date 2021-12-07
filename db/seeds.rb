# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.destroy_all
Venue.destroy_all
@city_1 = City.create!(name: "Denver", population: 750000, coastal: false)
@city_2 = City.create!(name: "DC", population: 750000, coastal: true)
@venue_1 = Venue.create!(name: "Cervantes", capacity: 1450, indoor: true, city_id: @city_1.id)
@venue_2 = Venue.create!(name: "Red Rocks", capacity: 9545, indoor: false, city_id: @city_1.id)








Dealer.destroy_all
Car.destroy_all
@dealer_1 = Dealer.create!(name: 'Aurora', open: true, zip: 80016)
@dealer_2 = Dealer.create!(name: 'Virginia', open: true, zip: 22642)
@car_1 = @dealer_1.cars.create!(make: 'Volvo', new: true, year: 2021, vin: 23456)
@car_2 = @dealer_2.cars.create!(make: 'Audi', new: false, year: 2019, vin: 7829291)

