class Oystercard
  attr_reader :balance
  attr_accessor :in_journey

  LIMIT = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "limit is £#{LIMIT} exceeded" if (@balance += amount) > LIMIT
  end

  def in_journey?
    @in_journey
  end

  def touch_in
      fail "Insufficient balance to check in" if balance < MINIMUM_BALANCE
      @in_journey = true
  end

  def touch_out
    deduct(2)
    @in_journey = false
  end

  private

  def deduct(amount)
    @balance -= amount
  end
  
end