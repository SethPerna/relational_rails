require 'rails_helper'

describe 'dealer index page' do
  before do
    @dealer_1 = Dealer.create!(name: 'Aurora', open: true, zip: 80016)
    @dealer_2 = Dealer.create!(name: 'Virginia', open: true, zip: 22642)


    visit '/dealers'
  end

  describe 'when I visit dealer index page' do
    it 'I see the name of each dealer' do

      expect(page).to have_content(@dealer_1.name)
      expect(page).to have_content(@dealer_2.name)
    end

    it 'I see dealers are ordered by the most recently created first' do
      expect(@dealer_2.name).to appear_before(@dealer_1.name)
    end

    it 'next to each dealer I see the date it was created' do

      expect(page).to have_content(@dealer_2.created_at)
    end

    it 'I see a link at the top of the page that takes me to the cars index' do
      click_link "Cars"

      expect(page).to have_link("Cars", :href=>"/cars")
      expect(page).to have_current_path("/cars")
    end

    it 'I see a link at the top of the page that takes me to the dealears index' do
      click_link "Cars"

      expect(page).to have_link("Cars", :href=>"/cars")
      expect(page).to have_current_path("/cars")
    end
  end
end
