class AvailablePositions
  def self.call(*args) = new(*args).call

  def initialize(board, movements, position)
    @board = board.dup
    @movements = movements
    @cursor = position
  end

  attr_reader :cursor, :movements

  def call

  end

  def permitted
    movements
  end
end
