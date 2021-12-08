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

    it 'I see a link at the top of the page that takes me to the dealers index' do
      click_link "Dealers"

      expect(page).to have_link("Dealers", :href=>"/dealers")
      expect(page).to have_current_path("/dealers")
    end

    it 'I see a link to update that car, Update Car' do
      click_link "Update Car"

      expect(page).to have_button("Update Car")
      expect(page).to have_current_path("/cars/#{@car_1.id}/edit")

      fill_in('Make', with: 'Toyota')
      fill_in('New', with: true)
      fill_in('Year', with: 2021)
      fill_in('Vin', with: '5375795')
      click_button('Update Car')

      expect(current_path).to eq("/cars/#{@car_1.id}")
      expect(page).to have_content("Toyota")
    end
  end
end