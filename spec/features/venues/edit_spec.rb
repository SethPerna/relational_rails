require 'rails_helper'
describe 'When I edit a venue' do
  it 'I see a link to Update Venue' do
    @city_1 = City.create!(name: "Denver", population: 750000, coastal: false)
    @venue_1 = @city_1.venues.create!(name: "Cervantes", capacity: 1450, indoor: true)
    visit "/venues/#{@venue_1.id}"

    expect(page).to have_link('Update Venue')
  end

  it 'links to the edit page' do
    @city_1 = City.create!(name: "Denver", population: 750000, coastal: false)
    @venue_1 = @city_1.venues.create!(name: "Cervantes", capacity: 1450, indoor: true)
    visit "/venues/#{@venue_1.id}"
    click_link "Update Venue"

    expect(current_path).to eq("/venues/#{@venue_1.id}/edit")
  end

  it 'can edit the venue' do
    @city_1 = City.create!(name: "Denver", population: 750000, coastal: false)
    @venue_1 = @city_1.venues.create!(name: "Cervantes", capacity: 1450, indoor: true)
    visit "/venues/#{@venue_1.id}/edit"

    fill_in 'Name', with: 'Red Rocks'
    fill_in 'Capacity', with: '7500'
    fill_in 'Indoor', with: 'false'
    click_button "Update Venue"

    expect(current_path).to eq("/venues/#{@venue_1.id}")
    expect(page).to have_content('Red Rocks')
  end
end
