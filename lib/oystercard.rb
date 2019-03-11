class Oystercard

  attr_reader :balance, :entry_station
  attr_writer :balance

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 2

  def initialize
    @balance = 0
    @in_use = false
    @entry_station = nil
  end

  def top_up(amount)
    fail "The new balance exceeds the limit of #{MAX_BALANCE}!" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    @in_use
  end

  def touch_in(station)
    fail "Not enough money :(" if @balance < MIN_BALANCE
    @in_use = true
    @entry_station = station
  end

  def touch_out
    deduct(MIN_FARE)
    @in_use = false
    @entry_station = nil
  end
  private
  def deduct(amount)
    @balance -= amount
  end


end
