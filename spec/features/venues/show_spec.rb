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
  end
end
