class Oystercard

  attr_reader :balance
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 2

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    fail "The new balance exceeds the limit of #{MAX_BALANCE}!" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    @in_use
  end

  def touch_in
    fail "Not enough money :(" if @balance < MIN_BALANCE
    @in_use = true
  end

  def touch_out
    deduct(MIN_FARE)
    @in_use = false
  end
  private
  def deduct(amount)
    @balance -= amount
  end


end
