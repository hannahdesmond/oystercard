class Journey 
  attr_reader :entry_station
  attr_accessor :exit_station
  PENALTY_FARE = 10

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  def complete?
    !(@exit_station == nil) && !(@entry_station == nil)
  end

  def fare
    complete? ? 1 + calculate_fare : PENALTY_FARE
  end

  def calculate_fare
    @exit_station.zone - @entry_station.zone
  end

  def finish(station)
    @exit_station = station
    self
  end
end
