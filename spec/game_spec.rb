require 'spec_helper'
require 'game'

describe Game do
  subject(:game) { described_class.new(player1: player1, player2: player2) }

  let(:player1) { spy :player1, hit_points: 60 }
  let(:player2) { spy :player2, hit_points: 0 }

  it 'attacks a player' do
    game.attack(player2)
    expect(player2).to have_received(:receive_hit)
  end

  it 'is player_1 turn' do
    expect(game.turn).to eq player1
  end

  it 'switches the turn when player attacks' do
    game.attack(player2)
    expect(game.turn).to eq player2
  end

  it 'sets player 1 status to Lose when their HP reaches 0 first' do
    game.attack(player2)
    expect(player2).to have_received(:lose)
  end
end
