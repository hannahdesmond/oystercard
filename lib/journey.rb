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
    complete? ? 1 : PENALTY_FARE
  end

  def finish(station)
    @exit_station = station
    self
  end

  # Should all of these by public methods?
  # Which ones are only called within the class?

  
end
