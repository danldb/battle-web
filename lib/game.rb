class Game
  attr_reader :player1, :player2

  def initialize(player1:, player2:)
    @player1 = player1
    @player2 = player2
    @players = [@player1, @player2]
  end

  def attack(player)
    player.receive_hit
    switch_turn
    set_status(player)
  end

  def turn
    players.first
  end

  private

  attr_accessor :players

  def set_status(player)
    other_player = (players - [player]).first
    if player.hit_points == 0 and other_player.hit_points != 0
      player.lose
    end
  end

  def switch_turn
    self.players = players.reverse
  end

  attr_writer :turn
end
