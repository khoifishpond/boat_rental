require 'rspec'
require './lib/dock'
require './lib/renter'
require './lib/boat'

describe Dock do
  dock = Dock.new("The Rowing Dock", 3)
  
  context 'Attributes' do
    it 'exists' do
      expect(dock).to be_a(Dock)
    end

    it 'has a name' do
      expect(dock.name).to eq("The Rowing Dock")
    end

    it 'has a maximum rental time' do
      expect(dock.max_rental_time).to eq(3)
    end
  end
end