require 'journey'
require 'oystercard'

describe Journey do
  let(:station) { double :station, zone: 1}
  let(:station2) { double :station, zone: 1}

  it 'starts with empty journeys' do
    expect(subject.journey).to eq ({
      entry_station: nil,
      exit_station: nil,
    })
  end


  it 'knows if a journey is not complete' do
    expect(subject).not_to be_complete
  end


  # it 'updates the entry station' do
  #   subject.touch_in(:station)
  #   expect(journey)
  # end



  # it 'deducts penalty fare for incomplete journey' do 
  #   oystercard
  #   subject.not_to be_complete
  #   expect(subject.fare).to change {oystercard.balance}.by -Oystercard::PENALTY

  # end 

  it 'returns itself when exiting journey' do 
    expect(subject.exit(station)).to eq subject.journey

  end 


describe 'already touched in' do
  it 'has an entry station' do 
    subject.entry_station = station
    expect(subject.entry_station).to eq station
  end

  it 'has penalty fare and returns fare if not touched out' do 

    subject.journey = { entry_station: station, exit_station: nil}
    p subject.complete?
    expect(subject.fare).to eq Journey::PENALTY
  end 

  before do 
    subject.exit(station2)
  end 

  describe 'touched out at exit station' do
    it 'calculates fare' do 
      subject.journey = { entry_station: station, exit_station: station2}

      expect(subject.fare).to eq 1
    end 
  end 


end 



end