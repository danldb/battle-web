require 'spec_helper'
require 'game'

describe Game do
  subject(:game) { described_class.new(player1: player1, player2: player2) }

  let(:player1) { spy :player1 }
  let(:player2) { spy :player2 }

  it 'attacks a player' do
    game.attack(:player2)
    expect(player2).to have_received(:receive_hit)
  end
end
