require 'rails_helper'

describe 'city #show page' do
  before do
    @city_1 = City.create!(name: "Denver", population: 750000, coastal: false)
    @venue_1 = @city_1.venues.create!(name: "Cervantes", capacity: 1450, indoor: true)
    @venue_2 = @city_1.venues.create!(name: "Red Rocks", capacity: 9545, indoor: false)
    visit "/cities/#{@city_1.id}"
  end
  describe 'when I visit city show page' do
    it 'I see that city and its attributes' do

      expect(page).to have_content(@city_1.name)
      expect(page).to have_content(@city_1.population)
      expect(page).to have_content(@city_1.coastal)
    end
    it 'I see count of venues for each city' do

      expect(page).to have_content("Number of venues: #{@city_1.count_venues}")
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
