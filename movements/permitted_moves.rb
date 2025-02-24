require_relative 'movements'

class PermittedMoves
  include Movements

  attr_reader :movements, :board, :position, :permitted, :piece

  def self.call(*args) = new(*args).call

  def initialize(piece, board)
    p "movements", piece.movements
    @piece = piece
    @movements = piece.movements
    @board = board
    @position = piece.position
    @permitted = []
  end

  def call
    movements.each do |movement|
      method(movement.to_sym).call
    end
    permitted
  end
end
