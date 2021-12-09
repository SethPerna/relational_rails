require 'rails_helper'

describe 'Car Delete' do

  it 'I see a link to delete the car' do
    dealer_1 = Dealer.create!(name: 'Aurora', open: true, zip: 80016)
    dealer_2 = Dealer.create!(name: 'Virginia', open: true, zip: 22642)
    car_1 = dealer_1.cars.create!(make: 'Volvo', new: true, year: 2021, vin: 23456)
    car_2 = dealer_2.cars.create!(make: 'Audi', new: true, year: 2021, vin: 7829291)
    dealer_4 = Dealer.create!(name: 'Phoenix', open: true, zip: 85228)
    car_4 = dealer_1.cars.create!(make: 'BMW', new: true, year: 2021, vin: 250825)

    visit "/cars/#{car_4.id}"

    click_link "Delete Car"

    expect(current_path).to eq("/cars")
    expect(page).to_not have_content("BMW")
  end
end