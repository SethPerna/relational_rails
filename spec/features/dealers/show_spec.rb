require 'rails_helper'

describe 'dealer show page' do
  before do
    @dealer_1 = Dealer.create!(name: 'Aurora', open: true, zip: 80016)

    visit "/dealers/#{@dealer_1.id}"
  end

  describe 'when I visit dealer show page' do
    it 'I see the dealer with that id including the dealers attributes' do

      expect(page).to have_content(@dealer_1.name)
      expect(page).to have_content(@dealer_1.open)
      expect(page).to have_content(@dealer_1.zip)
    end
    it 'I see a count of the number of cars associated with this dealer' do

      expect(page).to have_content("Number of cars: #{@dealer_1.count_cars}")
    end
  end
end