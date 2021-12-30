require 'journeylog'
describe JourneyLog do
  let(:station) { double :station }
  let(:other_station) { double :other_station }
  let(:journey) { spy :journey, entry_station: station, exit_station: other_station}
  let(:journey_class) { double :journey_class, new: journey } 
  subject {described_class.new(journey_class: journey_class)}
  
  describe 'past journeys' do
    it 'holds a default list of past journeys' do
      expect(subject.journeys).to eq([])
    end
    describe '#start' do
      it 'starts a new journey with an entry station' do
        subject.start(station)
        expect(journey_class).to have_received(:new).with(station)
      end
      it 'records a journey' do
        subject.start(station)
        expect(subject.journeys).to include(journey)
      end
    end
    describe '#finish' do
      it 'should add an exit station where there is an entry station' do
        subject.start(station)
        subject.finish(other_station)
        subject.start(station)
        subject.finish(other_station)
        expect(subject.journeys).to include(journey, journey)
      end
    end
  end
  
end