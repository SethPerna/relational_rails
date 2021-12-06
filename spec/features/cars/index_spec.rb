require 'rails_helper'

describe 'cars index page' do
  before do
    @dealer_1 = Dealer.create!(name: 'Aurora', open: true, zip: 80016)
    @dealer_2 = Dealer.create!(name: 'Virginia', open: true, zip: 22642)
    @car_1 = @dealer_1.cars.create!(make: 'Volvo', new: true, year: 2021, vin: 23456)
    @car_2 = @dealer_2.cars.create!(make: 'Audi', new: false, year: 2019, vin: 7829291)

    visit '/cars'
  end
  describe 'when I visit car index page' do
    it 'I see the make of each car' do

      expect(page).to have_content(@car_1.make)
      expect(page).to have_content(@car_1.new)
      expect(page).to have_content(@car_1.year)
      expect(page).to have_content(@car_1.vin)
      expect(page).to have_content(@car_2.make)
      expect(page).to have_content(@car_2.new)
      expect(page).to have_content(@car_2.year)
      expect(page).to have_content(@car_2.vin)
    end
  end
end