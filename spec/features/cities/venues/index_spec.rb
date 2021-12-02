# User Story 5, Parent Children Index (x2)
#
# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes:
require 'rails_helper'
describe 'Cities venues index' do
  before do
    @city_1 = City.create!(name: "Denver", population: 750000, coastal: false)
    @venue_1 = @city_1.venues.create!(name: "Cervantes", capacity: 1450, indoor: true)
    @venue_2 = @city_1.venues.create!(name: "Red Rocks", capacity: 9545, indoor: false)
    visit "/cities/#{@city_1.id}/venues"
  end
  it 'shows all of the venues for the city' do

    expect(page).to have_content(@venue_1.name)
    expect(page).to have_content(@venue_2.name)
  end

  it 'shows all attributes for the venue' do

    expect(page).to have_content(@venue_1.capacity)
    expect(page).to have_content(@venue_2.capacity)
    expect(page).to have_content(@venue_1.indoor)
    expect(page).to have_content(@venue_2.indoor)
  end
end
