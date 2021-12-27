require_relative 'journey'
require_relative 'station'

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

  def touch_in(station)
    fail "Insufficient balance to check in" if balance < MINIMUM_BALANCE
    @journey = Journey.new(station)
  end

  def touch_out(station)
    @journey.exit_station = station
    @journeys << (@journey.finish(station))
    deduct(@journey.fare) 
  end

  private

  def deduct(amount)
    @balance -= amount
  end
  
end