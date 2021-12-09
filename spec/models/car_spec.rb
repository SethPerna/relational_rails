require 'rails_helper'
describe Car do
  describe 'relations' do
    it { should belong_to :dealer }
  end

  it 'only shows new cars' do
    dealer_1 = Dealer.create!(name: 'Aurora', open: true, zip: 80016)
    car_1 = dealer_1.cars.create!(make: 'Volvo', new: true, year: 2021, vin: 23456)
    car_2 = dealer_1.cars.create!(make: 'Audi', new: false, year: 2019, vin: 7829291)

    expect(Car.is_new?).to eq([car_1])
  end
end