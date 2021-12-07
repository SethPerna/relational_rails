require 'rails_helper'
describe 'destroy venue' do
  it 'can delete the venue from the show page' do
    city_1 = City.create!(name: "Denver", population: 750000, coastal: false)
    city_2 = City.create!(name: "DC", population: 750000, coastal: true)
    venue_1 = city_1.venues.create!(name: "Cervantes", capacity: 1450, indoor: true)
    venue_2 = city_1.venues.create!(name: "Red Rocks", capacity: 9545, indoor: false)
    venue_3 = city_2.venues.create!(name: "9:30 Club", capacity: 1545, indoor: true)

    visit "/venues/#{venue_1.id}"
    click_button 'Delete Venue'
    expect(current_path).to eq('/venues')
    expect(page).to_not have_content("Cervantes")
  end
  it 'from index page every venue has a delete link' do
    city_1 = City.create!(name: "Denver", population: 750000, coastal: false)
    city_2 = City.create!(name: "DC", population: 750000, coastal: true)
    venue_1 = city_1.venues.create!(name: "Cervantes", capacity: 1450, indoor: true)
    venue_2 = city_1.venues.create!(name: "Red Rocks", capacity: 9545, indoor: false)
    venue_3 = city_2.venues.create!(name: "9:30 Club", capacity: 1545, indoor: true)
    visit '/venues'
    expect(page).to have_link("Delete #{venue_1.name}")
    click_link("Delete #{venue_1.name}")
    expect(current_path).to eq("/venues")
    expect(page).to_not have_content("Cervantes")
  end
end
