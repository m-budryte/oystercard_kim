require 'station'

describe Station do

  it 'has name and zone' do 
    Station = Struct.new(:name, :zone)
    station1 = Station.new('Aldgate', 1)
    expect(station1).to have_attributes(:name => 'Aldgate', :zone => 1)
  end 
end