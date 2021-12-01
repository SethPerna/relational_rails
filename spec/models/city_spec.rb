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
end
