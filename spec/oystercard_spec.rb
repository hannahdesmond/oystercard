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
end