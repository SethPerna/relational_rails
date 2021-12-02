require 'rails_helper'

describe 'dealer show page' do
  before do
    @dealer_1 = Dealer.create!(name: 'Aurora', has_inventory: true, zip: 80016)

    visit "/dealers/#{dealer:id}"
  end

  describe 'when I visit dealer show page' do
    it 'I see the dealer with that id including the dealers attributes' do

      expect(page).to have_content(@dealer_1.name)
      expect(page).to have_content(@dealer_1.has_inventory)
      expect(page).to have_content(@dealer_1.zip)
    end
  end
end