require 'rspec'
require './lib/boat'

describe Boat do
  kayak = Boat.new(:kayak, 20)

  it 'exists' do
    expect(kayak).to be_a(Boat)
  end
end