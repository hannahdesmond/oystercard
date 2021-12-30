require 'journeylog'
describe JourneyLog do
  let(:station) { double :station }
  let(:other_station) { double :other_station }
  let(:journey) { double :journey, entry_station: station, exit_station: other_station }
  let(:journey_class) { double :journey_class, new: journey } 
  subject {described_class.new(journey_class: journey_class)}
  
  describe 'past journeys' do
    it 'holds a default list of past journeys' do
      expect(subject.journeys).to eq([])
    end
    describe '#start'
      it 'starts a new journey with an entry station' do
        subject.start(station)
        expect(journey_class).to have_received(:new).with(station)
      end
  end
end