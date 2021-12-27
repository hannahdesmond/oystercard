require 'station'

describe Station do
  it 'has a name' do
    station = Station.new('brixton', 3)
    expect(station.station).to eq('brixton')
  end
  it 'has a zone' do
    station = Station.new('brixton', 3)
    expect(station.zone).to eq(3)
  end
end