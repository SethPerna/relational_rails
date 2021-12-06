# User Story 19, Parent Delete (x2)
#
# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent
require 'rails_helper'
describe 'destroy city' do
  it 'can delete the city from the show page' do
    city_1 = City.create!(name: "Denver", population: 750000, coastal: false)
    city_2 = City.create!(name: "DC", population: 750000, coastal: true)
    venue_1 = city_1.venues.create!(name: "Cervantes", capacity: 1450, indoor: true)
    venue_2 = city_1.venues.create!(name: "Red Rocks", capacity: 9545, indoor: false)
    venue_3 = city_2.venues.create!(name: "9:30 Club", capacity: 1545, indoor: true)

    visit "/cities/#{city_1.id}"
    click_button 'Delete City'
    expect(current_path).to eq('/cities')
    expect(page).to_not have_content("Denver")
  end
end
