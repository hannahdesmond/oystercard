require 'oystercard'

describe Oystercard do
  it 'starts not in a journey' do
    expect(subject.in_journey?).to eq(false)
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
    let(:station) { double :station }
    it 'knows the card is in journey after touching in' do
      subject.top_up(1)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq(true)
      expect(subject.entry_station).to eq(station)
    end
    it 'can only touch in if there is the minimum balance' do
      expect{ subject.touch_in(station) }.to raise_error("Insufficient balance to check in")
    end
  end

  describe '#touch_out' do
    let(:station) { double :station }
    before do
      subject.top_up(10)
      subject.touch_in(station)
    end
    it 'knows the card is not in journey after touching out' do
      subject.touch_out
      expect(subject.in_journey?).to eq(false)
    end
    it 'deducts the fare from my card' do
      expect { subject.touch_out }.to change{ subject.balance }.by(-2)
    end
    it 'forgets the station on touch out' do
      subject.touch_out
      expect(subject.entry_station).to be_nil
    end
  end
end