class Oystercard
  attr_reader :balance
  attr_accessor :in_journey

  LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "limit is £#{LIMIT} exceeded" if (@balance += amount) > LIMIT
  end

  def deduct(amount)
    fail "You have insufficient balance" if (@balance -= amount) < 0
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
  
end