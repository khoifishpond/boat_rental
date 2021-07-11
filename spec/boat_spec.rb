require 'rspec'
require './lib/boat'

describe Boat do
  kayak = Boat.new(:kayak, 20)

  context 'Attributes' do
    it 'exists' do
      expect(kayak).to be_a(Boat)
    end

    it 'has a type' do
      expect(kayak.type).to eq(:kayak)
    end

    it 'has a price per hour' do
      expect(kayak.price_per_hour).to eq(20)
    end
  end
end