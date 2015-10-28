require 'spec_helper'
require 'game'

describe Game do
  subject(:game) { described_class.new }
  let(:player){spy :player}
  it 'attacks a player' do
    game.attack(player)
    expect(player).to have_received(:receive_hit)
  end
end
