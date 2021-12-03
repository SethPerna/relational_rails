require 'rails_helper'
describe City do
  describe 'relations' do
    it { should have_many :venues }
  end
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :population }
    #it { should validate_presence_of :coastal }
  end
  it 'orders by created_at' do
    city_1 = City.create!(name: "Denver", population: 750000, coastal: false)
    city_2 = City.create!(name: "DC", population: 750000, coastal: true)

    expect(City.in_order).to eq([city_2, city_1])
  end
  it 'counts venues by city' do
    city_1 = City.create!(name: "Denver", population: 750000, coastal: false)
    venue_1 = city_1.venues.create!(name: "Cervantes", capacity: 1450, indoor: true)
    venue_2 = city_1.venues.create!(name: "Red Rocks", capacity: 9545, indoor: false)

    expect(city_1.count_venues).to eq(2)
  end
end
