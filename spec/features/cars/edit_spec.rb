require 'rails_helper'

describe 'When I edit the car' do

  it 'I see a link to update that car, Update Car' do
    dealer_1 = Dealer.create!(name: 'Aurora', open: true, zip: 80016)
    dealer_2 = Dealer.create!(name: 'Virginia', open: true, zip: 22642)
    car_1 = dealer_1.cars.create!(make: 'Volvo', new: true, year: 2021, vin: 23456)
    car_3 = dealer_1.cars.create!(make: 'Seth', new: true, year: 2021, vin: 23456)
    car_2 = dealer_2.cars.create!(make: 'Audi', new: false, year: 2019, vin: 7829291)
    visit "/cars/#{car_1.id}"
    click_link "Update Car"

    expect(current_path).to eq("/cars/#{car_1.id}/edit")
    expect(page).to have_button("Update Car")

    fill_in('Make', with: 'Toyota')
    fill_in('New', with: true)
    fill_in('Year', with: 2021)
    fill_in('Vin', with: '5375795')
    click_button('Update Car')

    expect(current_path).to eq("/cars/#{car_1.id}")
    expect(page).to have_content("Toyota")
  end
end