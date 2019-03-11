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
end
