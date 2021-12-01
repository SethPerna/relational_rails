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
  end
end
