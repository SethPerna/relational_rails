require 'rails_helper'

describe 'Dealer Car Creation' do
  before do
    @dealer_1 = Dealer.create!(name: 'Aurora', open: true, zip: 80016)
    @car_1 = @dealer_1.cars.create!(make: 'Volvo', new: true, year: 2021, vin: 23456)
    visit "/dealers/#{@dealer_1.id}/cars"
  end

  it 'I see a link to add a new adoptable car record, Create Car' do
    expect(page).to have_link("Create Car")
    click_link "Create Car"

    expect(current_path).to eq("/dealers/#{@dealer_1.id}/cars/new")
    expect(page).to have_current_path("/dealers/#{@dealer_1.id}/cars/new")
  end

  it 'creates a new car record' do

    click_link "Create Car"
    fill_in('Make', with: 'Chevy')
    fill_in('New', with: true)
    fill_in('Year', with: 2021)
    fill_in('Vin', with: '345097405')
    click_button('Create Car')

    expect(current_path).to eq("/dealers/#{@dealer_1.id}/cars")
    expect(page).to have_content("Chevy")
  end
end