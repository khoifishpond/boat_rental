class Dock
  attr_reader :name, :max_rental_time, :rental_log, :charged

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
    @charged = {}
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
end