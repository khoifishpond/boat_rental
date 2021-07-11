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
  end
end