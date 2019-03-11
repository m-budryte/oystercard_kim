require 'oystercard'
describe Oystercard do
  it 'has an entry station nil by default' do
    expect(subject.entry_station).to eq nil
  end

  it 'has a var of "balance"' do
    expect(subject).to respond_to(:balance)
  end

  it 'has default balance of 0' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it 'has a method of top_up' do
      expect(subject).to respond_to(:top_up)
    end

    it 'adds a specific amount to the balance' do
      subject.top_up(5)
      expect(subject.balance).to eq 5
    end

    it "should raise an error if the new balance would exceed the limit" do
      expect { subject.top_up(91) }.to raise_error('The new balance exceeds the limit of 90!')
    end

    it "should raise the same error (different test)" do
      maximum_balance = Oystercard::MAX_BALANCE
      subject.top_up(maximum_balance)
      expect { subject.top_up(1) }.to raise_error "The new balance exceeds the limit of #{maximum_balance}!"
    end
  end

  describe '#in_journey?' do
    let(:station) { double :station }
    it 'has a method of in_journey?' do
      expect(subject).to respond_to(:in_journey?)
    end

    it 'is not journey by default' do
      expect(subject.in_journey?).to eq false
    end

    it 'is initially not in a journey' do
      expect(subject).not_to be_in_journey
    end

    it 'can touch in' do
      subject.top_up(Oystercard::MAX_BALANCE)
      subject.touch_in(:station)
      expect(subject).to be_in_journey
    end
  end
  describe '#touch_in' do
    before(:each) do
    subject.top_up(Oystercard::MAX_BALANCE)
    end

    it 'has a method of touch_in' do
      expect(subject).to respond_to(:touch_in).with(1).argument
    end

    it 'raises an error if there is not enough money' do
      subject.balance = 0
      expect { subject.touch_in(:station) }.to raise_error("Not enough money :(")
    end

    it 'updates the entry station' do
      subject.touch_in(:station)
      expect(subject.entry_station).to eq :station
    end
  end

  describe '#touch_out' do
    before(:each) do
    subject.top_up(Oystercard::MAX_BALANCE)
    end

    it 'has a method of touch_out' do
      expect(subject).to respond_to(:touch_out)
    end

    it 'can touch out' do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it 'forgets the entry station on touch out' do
      subject.touch_in(:station)
      subject.touch_out
      expect(subject.entry_station).to eq nil
    end

  end
end
