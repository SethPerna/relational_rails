require 'rails_helper'

describe 'venues #index page' do
  before do
    @city_1 = City.create!(name: "Denver", population: 750000, coastal: false)
    @venue_1 = @city_1.venues.create!(name: "Cervantes", capacity: 1450, indoor: true)
    @venue_2 = @city_1.venues.create!(name: "Red Rocks", capacity: 9545, indoor: false)
    visit '/venues'
  end
  describe 'when I visit venue index page' do
    it 'I see the name of each venue' do

      within "#venue-#{@venue_1.id}" do
        expect(page).to have_content(@venue_1.name)
        expect(page).to have_content(@venue_1.capacity)
        expect(page).to have_content(@venue_1.indoor)
      end
      within "#venue-#{@venue_2.id}" do
        expect(page).to have_content(@venue_2.name)
        expect(page).to have_content(@venue_2.capacity)
        expect(page).to have_content(@venue_2.indoor)
      end
    end
  end
end
