require 'player'

describe Player do
  subject(:player){ described_class.new('John')}
  it 'has a name' do
    expect(player.name).to eq 'John'
  end
end
