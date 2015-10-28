require 'spec_helper'
require 'player'

describe Player do
  subject(:player){ described_class.new('John')}
  it 'has a name' do
    expect(player.name).to eq 'John'
  end

  it 'has hit points' do
    expect(player.hit_points).to eq 60
  end

  it 'reduces hit points when hit' do
    player.receive_hit
    expect(player.hit_points).to eq 40
  end
end
