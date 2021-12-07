require 'rails_helper'

describe 'Dealer creation' do
  it 'I see a link to create a new dealer record, New Dealer' do
    visit '/dealers'
    click_link "New Dealer"

    # expect(page).to have_link("New Dealer", :href="dealers/new")
    expect(page).to have_current_path("/dealers/new")
  end

  it 'creates a new dealer record' do
    visit '/dealers/new'

    fill_in('Name', with: 'Denver')
    fill_in('Open', with: true)
    fill_in('Zip', with: '80019')
    click_button('Create Dealer')

    expect(current_path).to eq("/dealers")
    save_and_open_page
    expect(page).to have_content("80019")
  end
end