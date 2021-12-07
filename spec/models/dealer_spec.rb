require 'rails_helper'
describe Dealer do
  describe 'relations' do
    it { should have_many :cars }
  end
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :open }
    it { should validate_presence_of :zip }
  end

  it 'put dealers in order by created_at' do
    dealer_1 = Dealer.create!(name: 'Aurora', open: true, zip: 80016)
    dealer_2 = Dealer.create!(name: 'Virginia', open: true, zip: 22642)

  expect(Dealer.in_order).to eq([dealer_2, dealer_1])
  end
end