require 'rails_helper'

describe 'dealers cars index page' do
  before do
    @dealer_1 = Dealer.create!(name: 'Aurora', open: true, zip: 80016)
    @car_1 = @dealer_1.cars.create!(make: 'Volvo', new: true, year: 2021, vin: 23456)
    @car_2 = @dealer_1.cars.create!(make: 'Audi', new: false, year: 2019, vin: 7829291)

    visit "/dealers/#{@dealer_1.id}/cars"
  end

  it 'I see the make of the car' do

    expect(page).to have_content(@car_1.make)
    expect(page).to have_content(@car_2.make)
  end

  it 'I see the attributes for the vehicles associated with that car' do

    expect(page).to have_content(@car_1.new)
    expect(page).to have_content(@car_1.year)
    expect(page).to have_content(@car_1.vin)
    expect(page).to have_content(@car_2.new)
    expect(page).to have_content(@car_2.year)
    expect(page).to have_content(@car_2.vin)
  end

  it 'I see a link at the top of the page that takes me to the cars index' do
    click_link "Cars"

    expect(page).to have_link("Cars", :href=>"/cars")
    expect(page).to have_current_path("/cars")
  end

  it 'I see a link at the top of the page that takes me to the dealears index' do
    click_link "Cars"

    expect(page).to have_link("Cars", :href=>"/cars")
    expect(page).to have_current_path("/cars")
  end
end