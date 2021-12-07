# User Story 5, Parent Children Index (x2)
#
# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes:
require 'rails_helper'
describe 'Cities venues index' do
  before do
    @city_1 = City.create!(name: "Denver", population: 750000, coastal: false)
    @city_2 = City.create!(name: "Shambala", population: 750000, coastal: false)
    @venue_2 = @city_1.venues.create!(name: "Red Rocks", capacity: 9545, indoor: false)
    @venue_1 = @city_1.venues.create!(name: "Cervantes", capacity: 1450, indoor: true)
    @venue_3 = @city_2.venues.create!(name: "Eldorado", capacity: 545, indoor: false)

    visit "/cities/#{@city_1.id}/venues"
  end
  it 'shows all of the venues for the city' do

    expect(page).to have_content(@venue_1.name)
    expect(page).to have_content(@venue_2.name)
    expect(page).to have_no_content(@venue_3.name)
  end

  it 'shows all attributes for the venue' do

    expect(page).to have_content(@venue_1.capacity)
    expect(page).to have_content(@venue_2.capacity)
    expect(page).to have_content(@venue_1.indoor)
    expect(page).to have_content(@venue_2.indoor)
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

  it 'I see a link to order venue' do

    expect(page).to have_link("Order Venues", :href=>"/cities/#{@city_1.id}/venues?sort=asc")
    click_link "Order Venues"
    expect(@venue_1.name).to appear_before(@venue_2.name)
  end

  it 'I see a link to delete the venue' do

    expect(page).to have_link("Delete #{@venue_1.name}")
    click_link("Delete #{@venue_1.name}")
    expect(current_path).to eq("/venues")
    expect(page).to_not have_content("Cervantes")
  end
end
