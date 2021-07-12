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
    if boat.hours_rented > @max_rental_time
      boat.hours_rented = @max_rental_time
    end

    @charged[:card_number] = @rental_log[boat].credit_card_number
    @charged[:amount] = boat.hours_rented * boat.price_per_hour
    @charged
  end
end