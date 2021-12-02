require 'rails_helper'

describe 'dealer index page' do
  before do
    @dealer_1 = Dealer.create!(name: 'Aurora', has_inventory: true, zip: 80016)
    @dealer_2 = Dealer.create!(name: 'Virginia', has_inventory: false, zip: 22642)

    visit '/dealers'
  end

  describe 'when I visit dealer index page' do
    it 'I see the name of each dealer' do

      expect(page).to have_content(@dealer_1.name)
      expect(page).to have_content(@dealer_2.name)
    end
  end
end