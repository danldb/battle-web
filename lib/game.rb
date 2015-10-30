class Game
  attr_reader :player1, :player2

  def initialize(player1:, player2:)
    @player1 = player1
    @player2 = player2
    @players = [@player1, @player2]
  end

  def attack(player)
    send(player).receive_hit
    switch_turn
  end

  def turn
    players.first
  end

  private

  attr_accessor :players
    end
  end

  def switch_turn
    self.players = players.reverse
  end

  attr_writer :turn
end
