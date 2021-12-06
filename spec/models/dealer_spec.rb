require 'rails_helper'
describe Dealer do
  describe 'relations' do
    it { should have_many :cars }
  end
  describe 'validations' do
    it { should validate_presence_of :name }
    #it { should validate_presence_of :has_inventory }
    it { should validate_presence_of :zip }
  end
end
