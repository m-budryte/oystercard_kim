require 'oystercard'
describe Oystercard do
  it 'has a var of "balance"' do
    expect(subject).to respond_to(:balance)
  end
  
  it 'has default balance of 0' do
    expect(subject.balance).to eq 0
  end
end
