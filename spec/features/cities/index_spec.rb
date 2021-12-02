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

    end
  end
end
