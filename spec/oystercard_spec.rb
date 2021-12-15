require 'oystercard'

describe Oystercard do
  it 'knows whether it is on a journey' do
    expect(subject.in_journey?).to eq(nil)
  end
  it 'starts with a balance of zero' do
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
  describe '#touch_in' do
    it 'knows the card is in journey after touching in' do
      subject.top_up(1)
      subject.touch_in
      expect(subject.in_journey).to eq(true)
    end
    it 'can only touch in if there is the minimum balance' do
      expect{ subject.touch_in }.to raise_error("Insufficient balance to check in")
    end
  end
  describe '#touch_out' do
    it 'knows the card is not in journey after touching out' do
      subject.top_up(10)
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey).to eq(false)
    end
  end
  describe '#deduct' do 
    it 'deducts the amount from the balance' do
      subject.top_up(10)
      subject.deduct(2)
      expect(subject.balance).to eq(8)
    end
  end
end