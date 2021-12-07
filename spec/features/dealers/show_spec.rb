require 'rails_helper'

describe 'dealer show page' do
  before do
    @dealer_1 = Dealer.create!(name: 'Aurora', open: true, zip: 80016)

    visit "/dealers/#{@dealer_1.id}"
  end

  describe 'when I visit dealer show page' do
    it 'I see the dealer with that id including the dealers attributes' do

      expect(page).to have_content(@dealer_1.name)
      expect(page).to have_content(@dealer_1.open)
      expect(page).to have_content(@dealer_1.zip)
    end
    it 'I see a count of the number of cars associated with this dealer' do

      expect(page).to have_content("Number of cars: #{@dealer_1.count_cars}")
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

    it 'I see a link to take me to that dealers cars index page' do
      expect(page).to have_link("#{@dealer_1.name} Cars")
      click_link "#{@dealer_1.name} Cars"
      expect(page).to have_current_path("/dealers/#{@dealer_1.id}/cars")
    end
  end
end