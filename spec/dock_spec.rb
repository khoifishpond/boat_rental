require 'rspec'
require './lib/dock'
require './lib/renter'
require './lib/boat'

describe Dock do
  dock = Dock.new("The Rowing Dock", 3)
  kayak_1 = Boat.new(:kayak, 20)
  kayak_2 = Boat.new(:kayak, 20)
  sup_1 = Boat.new(:standup_paddle_board, 15)
  patrick = Renter.new("Patrick Star", "4242424242424242")
  eugene = Renter.new("Eugene Crabs", "1313131313131313")

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

  context 'Rent' do
    # does this need testing?
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.rent(sup_1, eugene)

    it 'can store rentals in a log' do
      expect(dock.rental_log).to eq({
        kayak_1 => patrick,
        kayak_2 => patrick,
        sup_1 => eugene
      })
    end

    it 'can charge' do
      kayak_1.add_hour
      kayak_1.add_hour
      dock.charge(kayak_1)

      expect(dock.charge(kayak_1)).to eq({
        :card_number => "4242424242424242",
        :amount => 40
      })
    end
  end
end