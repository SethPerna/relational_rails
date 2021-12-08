require 'rails_helper'

describe 'city #index page' do
  before do
    @city_1 = City.create!(name: "Denver", population: 750000, coastal: false)
    @city_2 = City.create!(name: "DC", population: 750000, coastal: true)
    visit '/cities'
  end
  describe 'when I visit city index page' do
    it 'I see the name of each city' do

      expect(page).to have_content(@city_1.name)
      expect(page).to have_content(@city_2.name)
    end
    it 'I see cities are ordered by most recently created' do

      expect(@city_2.name).to appear_before(@city_1.name)
    end
    it 'next to each city I see when it was created' do

      expect(page).to have_content(@city_2.created_at)
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

    it 'I see a link to sort cities by the number of venues associated with that city' do

      expect(page).to have_link('Sort by # of Venues')
    end
  end
end
