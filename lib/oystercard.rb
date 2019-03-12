class Oystercard

  attr_reader :balance, :journey
  attr_writer :balance

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 2


  def initialize(journey = Journey.new)
    @balance = 0
    @journey = journey
    #@ journey is from journey class
  end

  def top_up(amount)
    fail "The new balance exceeds the limit of #{MAX_BALANCE}!" if @balance + amount > MAX_BALANCE
    @balance += amount
  end



  def touch_in(station)
    fail "Not enough money :(" if @balance < MIN_BALANCE
    p @journey
    @journey.journey = { :entry_station => station, :exit_station => nil}

  end

  def touch_out(station2)
    deduct(MIN_FARE)
 
    exit_station = station2

    @journey.journey[:exit_station]= station2
  end

  private
  def deduct(amount)
    @balance -= amount
  end


end
