require 'rails_helper'
describe Venue do
  describe 'relations' do
    it { should belong_to :city }
  end 
end
