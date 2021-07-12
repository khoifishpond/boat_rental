class Dock
  attr_reader :name, :max_rental_time, :rental_log, :charged, :boats_returned

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
    @charged = {}
    @boats_returned = []
  end

  def rent(boat, renter)
    @rental_log[boat] = renter
  end

  def charge(boat)
    @charged[:card_number] = @rental_log[boat].credit_card_number
    
    if boat.hours_rented > @max_rental_time
      @charged[:amount] = @max_rental_time * boat.price_per_hour
    else
      @charged[:amount] = boat.hours_rented * boat.price_per_hour
    end
    
    @charged
  end

  def return(boat)
    @boats_returned << boat
  end

  def revenue
    total_revenue = 0

    
  end

  def log_hour
    @rental_log.each_key do |boat|
      boat.add_hour
    end
  end
end