require 'rails_helper'
describe Car do
  describe 'relations' do
    it { should belong_to :dealer }
  end
end