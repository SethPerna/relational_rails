require 'rails_helper'

describe 'city #show page' do
  before do
    @city_1 = City.create!(name: "Denver", population: 750000, coastal: false)
    visit "/cities/#{@city_1.id}"
  end
  describe 'when I visit city show page' do
    it 'I see that city and its attributes' do

      expect(page).to have_content(@city_1.name)
      expect(page).to have_content(@city_1.population)
      expect(page).to have_content(@city_1.coastal)
    end
  end
end
