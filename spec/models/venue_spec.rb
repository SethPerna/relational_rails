require 'rails_helper'
describe Venue do
  describe 'relations' do
    it { should belong_to :city }
  end
  it 'only returns indoor venues' do
    city_1 = City.create!(name: "Denver", population: 750000, coastal: false)
    venue_1 = city_1.venues.create!(name: "Cervantes", capacity: 1450, indoor: true)
    venue_2 = city_1.venues.create!(name: "Red Rocks", capacity: 9545, indoor: false)

    expect(Venue.true_records).to eq([venue_1])
  end
end
