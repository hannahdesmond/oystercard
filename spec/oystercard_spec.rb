require 'oystercard'

describe Oystercard do
  it 'Start with a balance of zero' do
    expect(subject.balance).to eq(0) 
  end
  describe '#top_up' do
    it 'increments the balance' do
      expect { subject.top_up(10) }.to change { subject.balance }.by(10)
    end
  end
    it 'raises error if maximum balance is exceeded' do
      expect { subject.top_up(91) }.to raise_error 'limit is £90 exceeded'
    end
  describe '#deduct' do 
    it 'deducts the amount from the balance' do
      subject.top_up(10)
      subject.deduct(2)
      expect(subject.balance).to eq(8)
    end
    it 'raises an error if there is insufficient balance' do
      expect { subject.deduct(2) }.to raise_error "You have insufficient balance" 
    end
  end
end