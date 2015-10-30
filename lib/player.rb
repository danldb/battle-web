class Player
  attr_reader :name, :hit_points, :status

  def initialize(name)
    @name = name
    @hit_points = 60
  end

  def receive_hit
    self.hit_points -= 20
  end

  def lose
    self.status = :lose
  end

  def print_status
    status.to_s.capitalize if status
  end

  private

  attr_writer :hit_points, :status
end
