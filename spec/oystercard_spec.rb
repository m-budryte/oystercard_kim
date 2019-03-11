require 'oystercard'
describe Oystercard do
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

  describe '#deduct' do
    it 'has a method of deduct' do
      expect(subject).to respond_to(:deduct).with(1).argument
    end

    it 'deducts a specific amount from the balance' do
      subject.top_up(10)
      expect(subject.deduct(5)).to eq 5
    end
  end

  describe '#in_journey?' do
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
      subject.touch_in
      expect(subject).to be_in_journey
    end
  end
  describe '#touch_in' do
    it 'has a method of touch_in' do
      expect(subject).to respond_to(:touch_in)
    end
  end

  describe '#touch_out' do
    it 'has a method of touch_out' do
      expect(subject).to respond_to(:touch_out)
    end

    it 'can touch out' do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end
end
