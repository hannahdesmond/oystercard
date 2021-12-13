class Oystercard
  attr_reader :balance
  LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "limit is £#{LIMIT} exceeded" if (@balance += amount) > LIMIT
  end

end