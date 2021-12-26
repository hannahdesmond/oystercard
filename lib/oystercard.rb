class Oystercard
  attr_reader :balance
  attr_accessor :entry_station
  attr_accessor :journeys

  LIMIT = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @journeys= []
  end

  def top_up(amount)
    fail "limit is £#{LIMIT} exceeded" if (@balance += amount) > LIMIT
  end

  def in_journey?
    !(@entry_station == nil)
  end

  def touch_in(station)
      fail "Insufficient balance to check in" if balance < MINIMUM_BALANCE
      @in_journey = true
      @entry_station = station
  end

  def touch_out(station)
    @journeys << {@entry_station => station}
    deduct(2)
    @in_journey = false
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end
  
end