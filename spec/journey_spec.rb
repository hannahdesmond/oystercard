require 'journey'
require 'oystercard'

describe Journey do 
  let(:station) { double :station, zone: 1 }
  it 'starts as incomplete' do
    expect(subject.complete?).to eq(false)
  end
  it 'has a penalty fare by default' do
    expect(subject.fare).to eq(Journey::PENALTY_FARE)
  end
  it 'returns itself when the journey is finished' do
    expect(subject.finish(station)).to eq(subject)
  end
  context 'is given an entry station' do 
    subject {described_class.new(station)}
    it 'has an entry station' do
      expect(subject.entry_station).to eq(station)
    end
    it 'calculates the default fare if no exit station is given' do
      expect(subject.fare).to eq(Journey::PENALTY_FARE)
    end
    context 'also given an exit station' do
      let(:other_station) { double :other_station, zone: 1 }
      it 'calculates a fare' do
        subject.finish(other_station)
        expect(subject.fare).to eq(1)
      end
    end
  end
end



# when touching in, a new journey is created
# the entry station is stored
# when touching out, the journey is finished
# the fare is calculated
# the journey is pushed into the journey variable
# if an entry exit station not given, a penalty fare is added