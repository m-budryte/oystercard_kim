class Oystercard

  attr_reader :balance, :entry_station, :journeys
  attr_writer :balance

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 2

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    fail "The new balance exceeds the limit of #{MAX_BALANCE}!" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    @entry_station
  end

  def touch_in(station)
    fail "Not enough money :(" if @balance < MIN_BALANCE
    @in_use = true
    @entry_station = station
    @journeys << { :entry_station => station, :exit_station => nil}
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @in_use = false
    exit_station = station
    @journeys[-1][:exit_station] = station
    @entry_station = nil
  end

  private
  def deduct(amount)
    @balance -= amount
  end


end
