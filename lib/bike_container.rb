module BikeContainer
  DEFAULT_CAPACITY = 10

  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  attr_writer :capacity

  def bike_count
    bikes.count
  end

  def dock(bike)
    bikes << bike
  end

  def release(bike)
    bikes.delete(bike)
  end

  def full?
    bike_count == capacity
  end

  def transfer_broken_to(place)
    bikes.each do |bike|
      place.dock(bike) if bike.broken?
      release(bike) if bike.broken?
    end
  end

  def transfer_fixed_to(place)
    bikes.each { |bike| place.dock(bike) unless bike.broken? }
  end

  def available_bikes
    bikes.reject(&:broken?)
  end
end
