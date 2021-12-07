require 'rails_helper'

describe 'cars show page' do
  before do
    @dealer_1 = Dealer.create!(name: 'Aurora', open: true, zip: 80016)
    @car_1 = @dealer_1.cars.create!(make: 'Volvo', new: true, year: 2021, vin: 23456)

    visit "/cars/#{@car_1.id}"
  end
  describe 'when I visit car show page' do
    it 'I see the make of the car and its attributes' do

      expect(page).to have_content(@car_1.make)
      expect(page).to have_content(@car_1.new)
      expect(page).to have_content(@car_1.year)
      expect(page).to have_content(@car_1.vin)
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
end