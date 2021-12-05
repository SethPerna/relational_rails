require 'rails_helper'
describe 'cit edit' do
  it 'links to the edit page' do
    city_1 = City.create!(name: "Denver", population: 750000, coastal: false)

    visit "/cities/#{city_1.id}"

    click_button "Update #{city_1.name}"

    expect(current_path).to eq("/cities/#{city_1.id}/edit")
  end
  it 'can edit the city' do
    city_1 = City.create!(name: "Denve", population: 750000, coastal: false)
    visit "/cities/#{city_1.id}/edit"

    fill_in 'name', with: 'Boulder'
    fill_in 'population', with: '750000'
    fill_in 'coastal', with: 'false'
    click_button "Update City"

    expect(current_path).to eq("/cities/#{city_1.id}")
    expect(page).to have_content('Boulder')
  end
end
