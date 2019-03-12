require 'journey'
require 'oystercard'

describe Journey do
  let(:station) { double :station, zone: 1}

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

  it 'has penalty fare' do 
    expect(subject.fare).to eq Journey::PENALTY
  end 

  # it 'deducts penalty fare for incomplete journey' do 
  #   oystercard
  #   subject.not_to be_complete
  #   expect(subject.fare).to change {oystercard.balance}.by -Oystercard::PENALTY

  # end 

  it 'returns itself when exiting journey' do 
    expect(subject.exit(station)).to eq subject.journey

  end 


  it 'has an entry station' do 
    # expect(subject.entry_station).to eq 
  end

end