require 'oystercard'

describe Oystercard do
  it 'Start with a balance of zero' do
    expect(subject.balance).to eq(0) 
  end
end