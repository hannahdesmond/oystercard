class Journey 
  attr_reader :entry_station
  attr_accessor :exit_station
  PENALTY_FARE = 10

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  def complete?
    !(@exit_station == nil)
  end

  def fare
    if @entry_station == nil || @exit_station == nil
      PENALTY_FARE 
    end
  end

  def finish(station)
    self
  end

  
  

  # def finish - if exit station exists, 
  # push both stations to journey
  # if no exit station or entry station,
  # add penalty fare
  
end


# Each journey should have an entry and an exit station.
# Instances of journey should be initialised with 
# an optional entry station, 
# and respond to #finish, #fare and #complete? methods.
