require 'rails_helper'

describe 'Dealer Delete' do
  before do
    @dealer_1 = Dealer.create!(name: 'Aurora', open: true, zip: 80016)
    @dealer_2 = Dealer.create!(name: 'Virginia', open: true, zip: 22642)
    @dealer_3 = Dealer.create!(name: 'Phoenix', open: true, zip: 85228)
    @car_1 = @dealer_1.cars.create!(make: 'Volvo', new: true, year: 2021, vin: 23456)
    @car_2 = @dealer_2.cars.create!(make: 'Audi', new: false, year: 2019, vin: 7829291)
    @car_3 = @dealer_2.cars.create!(make: 'Ford', new: true, year: 2021, vin: 9866)
    @car_4 = @dealer_3.cars.create!(make: 'Dodge', new: false, year: 2019, vin: 90878756)

    visit "/dealers/#{@dealer_1.id}"
  end

  it 'I see a link to delete the dealer' do
    click_link "Delete Dealer"

    expect(current_path).to eq("/dealers")
    expect(page).to_not have_content("Volvo")
    expect(page).to_not have_content("Aurora")
  end
end