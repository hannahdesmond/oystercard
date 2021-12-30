require_relative 'journey'
require_relative 'station'
require_relative 'journeylog'

class Oystercard
  attr_reader :balance
  attr_accessor :journeys
  attr_accessor :in_journey


  LIMIT = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    fail "limit is £#{LIMIT} exceeded" if (@balance += amount) > LIMIT
  end

  def touch_in(journey = Journey.new(station))
    fail "Insufficient balance to check in" if balance < MINIMUM_BALANCE
    @journey = journey
  end

  def touch_out(station)
    @journey.exit_station = station
    @journeys << (@journey.finish(station))
    deduct(@journey.fare) 
    # Should these instance variables be
    # contained in wrapper/accessor methods?
  end

  private

  def deduct(amount)
    @balance -= amount
  end
  
end