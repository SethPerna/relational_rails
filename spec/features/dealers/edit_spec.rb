require 'rails_helper'

describe 'Dealer update' do
  it 'I see a link to update a dealer record Update Dealer' do
    dealer_1 = Dealer.create!(name: 'Aurora', open: true, zip: 80016)

    visit "/dealers/#{dealer_1.id}"
    click_link "Update Dealer"

    expect(current_path).to eq("/dealers/#{dealer_1.id}/edit")
  end

  it 'edits a dealer record' do
    dealer_1 = Dealer.create!(name: 'Aurora', open: true, zip: 80016)

    visit "/dealers/#{dealer_1.id}/edit"

    fill_in('Name', with: 'Philly')
    fill_in('Open', with: true)
    fill_in('Zip', with: '19131')

    click_button("Update Dealer")

    expect(current_path).to eq("/dealers/#{dealer_1.id}")
    expect(page).to have_content("19131")
  end
end