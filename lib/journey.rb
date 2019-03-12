class Journey
attr_accessor :journey
PENALTY = 6


  def initialize
    @journey = { :entry_station => nil, :exit_station => nil}
  end 


  def complete?

      if @journey[:exit_station] == nil 
      return false
      end 

  end

  def fare
    PENALTY unless complete? 
    

  end 

  def exit(station)
 
    @journey
  end 




end