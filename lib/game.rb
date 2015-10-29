class Game
  attr_reader :player1, :player2, :turn

  def initialize(player1:, player2:)
    @player1 = player1
    @player2 = player2
    @turn = :player1
  end

  def attack(player)
    send(player).receive_hit
    switch_turn
  end

  private

  def switch_turn
    if turn == :player1
      self.turn = :player2
    else
      self.turn = :player1
    end
  end

  attr_writer :turn
end
