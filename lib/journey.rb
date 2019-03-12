class Journey
attr_accessor :journey, :entry_station
PENALTY = 6
MINIMUM_FARE = 1

  def initialize
    @journey = { :entry_station => nil, :exit_station => nil}
  end 


  def complete?

      if @journey[:exit_station] == nil 
        false
      else
        true  
      end 

  end

  def fare
    if !complete? 
      PENALTY 
    else 
      MINIMUM_FARE
    end 
  end 



  def exit(station)
 
    @journey

  end 




end