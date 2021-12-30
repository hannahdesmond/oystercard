require 'oystercard'

describe Oystercard do
  
  it 'starts with a balance of zero' do
    expect(subject.balance).to eq(0) 
  end

  describe '#top_up' do
    it 'increments the balance' do
      expect { subject.top_up(10) }.to change { subject.balance }.by(10)
    end
    it 'raises error if maximum balance is exceeded' do
      expect { subject.top_up(91) }.to raise_error 'limit is £90 exceeded'
    end
  end

  describe '#touch_in' do
    let(:station) { double :station }
    let(:journey) { Journey.new(station) }

    it 'can only touch in when has the minimum balance' do
    expect{ subject.touch_in(station) }.to raise_error("Insufficient balance to check in")
    end
    it 'creates a new journey' do
      subject.top_up(40)
      subject.touch_in(journey)
      expect(journey).to have_attributes(:entry_station => station) 
    end
  end

  describe '#touch_out' do
    let(:station) { double :station, zone: 1 }
    let(:other_station) { double :other_station, zone: 3 }
    before do
      subject.top_up(10)
      subject.touch_in(Journey.new(station))
    end
    it 'deducts the fare from my card' do
      expect { subject.touch_out(station) }.to change{ subject.balance }.by(-1)
    end
    it 'deducts the right amount for crossing zones' do
      expect { subject.touch_out(other_station) }.to change{ subject.balance }.by(-3)
    end
  end
end