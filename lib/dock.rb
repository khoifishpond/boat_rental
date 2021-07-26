class Dock
  attr_reader :name, :max_rental_time, :rental_log, :charged, :boats_returned, :total_revenue

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
    @charged = {}
    @boats_returned = []
    @total_revenue = 0
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
    if @boats_returned.empty? == false
      amounts_charged = @boats_returned.map { |boat| charge(boat)[:amount] }
      @boats_returned.clear
      @total_revenue += amounts_charged.sum
    else
      @total_revenue
    end
  end

  def log_hour
    @rental_log.each_key { |boat| boat.add_hour }
  end
end