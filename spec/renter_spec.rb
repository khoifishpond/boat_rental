require 'rspec'
require './lib/renter'

describe Renter do
  patrick = Renter.new("Patrick Star", "4242424242424242")
  eugene = Renter.new("Eugene Crabs", "1313131313131313")

  context 'Attributes' do
    it 'exists' do
      expect(patrick).to be_a(Renter)
      expect(eugene).to be_a(Renter)
    end

    it 'has a name' do
      expect(patrick.name).to eq("Patrick Star")
    end

    it 'has a credit number' do
      expect(patrick.credit_card_number).to eq("4242424242424242")
    end
  end
end