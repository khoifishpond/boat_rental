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

    it 'starts with 0 hours rented' do
      expect(kayak.hours_rented).to eq(0)
    end
  end

  context 'Rent' do
    it 'can add hours' do
      kayak.add_hour
      kayak.add_hour
      kayak.add_hour

      expect(kayak.hours_rented).to eq(3)
    end
  end
end