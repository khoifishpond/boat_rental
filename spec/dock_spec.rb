require 'rspec'
require './lib/dock'
require './lib/renter'
require './lib/boat'

describe Dock do
  dock = Dock.new("The Rowing Dock", 3)
  
  it 'exists' do
    expect(dock).to be_a(Dock)
  end
end