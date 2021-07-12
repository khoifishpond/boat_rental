require 'rspec'
require './lib/dock'
require './lib/renter'
require './lib/boat'

describe Dock do
  context 'Attributes' do
    before(:each) do
      @dock = Dock.new("The Rowing Dock", 3)
      @kayak_1 = Boat.new(:kayak, 20)
      @kayak_2 = Boat.new(:kayak, 20)
      @canoe = Boat.new(:canoe, 25)
      @sup_1 = Boat.new(:standup_paddle_board, 15)
      @sup_2 = Boat.new(:standup_paddle_board, 15)
      @patrick = Renter.new("Patrick Star", "4242424242424242")
      @eugene = Renter.new("Eugene Crabs", "1313131313131313")
    end
    
    it 'exists' do
      expect(@dock).to be_a(Dock)
    end

    it 'has a name' do
      expect(@dock.name).to eq("The Rowing Dock")
    end

    it 'has a maximum rental time' do
      expect(@dock.max_rental_time).to eq(3)
    end
  end

  context 'Rent' do
    before(:each) do
      @dock = Dock.new("The Rowing Dock", 3)
      @kayak_1 = Boat.new(:kayak, 20)
      @kayak_2 = Boat.new(:kayak, 20)
      @canoe = Boat.new(:canoe, 25)
      @sup_1 = Boat.new(:standup_paddle_board, 15)
      @sup_2 = Boat.new(:standup_paddle_board, 15)
      @patrick = Renter.new("Patrick Star", "4242424242424242")
      @eugene = Renter.new("Eugene Crabs", "1313131313131313")
    end

    it 'can store rentals in a log' do
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_2, @patrick)
      @dock.rent(@sup_1, @eugene)

      expect(@dock.rental_log).to eq({
        @kayak_1 => @patrick,
        @kayak_2 => @patrick,
        @sup_1 => @eugene
      })
    end

    it 'can charge' do
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_2, @patrick)
      @dock.rent(@sup_1, @eugene)

      @kayak_1.add_hour
      @kayak_1.add_hour
      @dock.charge(@kayak_1)

      expect(@dock.charge(@kayak_1)).to eq({
        :card_number => "4242424242424242",
        :amount => 40
      })

      @sup_1.add_hour
      @sup_1.add_hour
      @sup_1.add_hour
      expect(@dock.charge(@sup_1)).to eq({
        :card_number => "1313131313131313",
        :amount => 45
      })

      @sup_1.add_hour
      @sup_1.add_hour
      expect(@dock.charge(@sup_1)).to eq({
        :card_number => "1313131313131313",
        :amount => 45
      })
    end

    it 'can log an additional hour' do
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_2, @patrick)
      @dock.log_hour

      expect(@kayak_1.hours_rented).to eq(1)
      expect(@kayak_2.hours_rented).to eq(1)

      @dock.rent(@canoe, @patrick)
      @dock.log_hour

      expect(@kayak_1.hours_rented).to eq(2)
      expect(@kayak_2.hours_rented).to eq(2)
      expect(@canoe.hours_rented).to eq(1)
    end

    it 'does not calculate revenue until boats are returned' do
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_2, @patrick)
      @dock.log_hour
      @dock.rent(@canoe, @patrick)
      @dock.log_hour

      expect(@dock.revenue).to eq(0)

      @dock.return(@kayak_1)
      @dock.return(@kayak_2)
      @dock.return(@canoe)

      expect(@dock.revenue).to eq(105)
    end
  end
end