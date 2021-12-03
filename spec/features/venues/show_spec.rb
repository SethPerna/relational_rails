require 'rails_helper'

describe 'venues #index page' do
  before do
    @city_1 = City.create!(name: "Denver", population: 750000, coastal: false)
    @venue_1 = @city_1.venues.create!(name: "Cervantes", capacity: 1450, indoor: true)
    visit "/venues/#{@venue_1.id}"
  end
  describe 'when I visit venue show page' do
    it 'I see the name of the venue and its attributes' do

      #within "#venue-#{@venue_1.id}" do
        expect(page).to have_content(@venue_1.name)
        expect(page).to have_content(@venue_1.capacity)
        expect(page).to have_content(@venue_1.indoor)
      #end
    end
    it 'I see a link at the top of the page that takes me to venues index' do
      click_link 'Venues'

      expect(page).to have_link("Venues", :href=>"/venues")
      expect(page).to have_current_path("/venues")
    end

    it 'I see a link at the top of the page that takes me to the cities index' do
      click_link 'Cities'

      expect(page).to have_link("Cities", :href=>"/cities")
      expect(page).to have_current_path("/cities")
    end
  end
end
