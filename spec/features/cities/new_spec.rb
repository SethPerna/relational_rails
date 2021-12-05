# User Story 11, Parent Creation (x2)
#
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.
require 'rails_helper'
describe 'The City creation' do
  it 'links to new page from city index' do
    visit '/cities'

    click_link('New City')
    expect(current_path).to eq('/cities/new')
  end
  it 'can create a new cities' do
    visit '/cities/new'

    fill_in('Name', with: 'Los Angeles')
    fill_in('Population', with: '1800000')
    fill_in('Coastal', with: true)
    click_button('Create City')


    expect(current_path).to eq("/cities")
    expect(page).to have_content("Los Angeles")
  end
end
