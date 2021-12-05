require 'rails_helper'
describe 'when I create a new venue' do
  before do
    @city_1 = City.create!(name: "Denver", population: 750000, coastal: false)
    @venue_1 = @city_1.venues.create!(name: "Cervantes", capacity: 1450, indoor: true)
    visit "/cities/#{@city_1.id}/venues"
  end

  it 'links to new page from city venues index' do
    expect(page).to have_link("Create Venue")
    expect(current_path).to eq("/cities/#{@city_1.id}/venues")
    click_link('Create Venue')
    expect(current_path).to eq("/cities/#{@city_1.id}/venues/new")
    fill_in('Name', with: 'Mishawaka')
    fill_in('Capacity', with: '900')
    fill_in('Indoor', with: false)
    click_button('Create Venue')

    expect(current_path).to eq("/cities/#{@city_1.id}/venues")
    expect(page).to have_content("Mishawaka")
  end

  # it 'can create a new venues' do
  #   visit "/cities/#{@city_1.id}/venues/new"
  #
  # end
end
