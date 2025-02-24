require_relative 'piece'

module Pieces
  class Bishop < Piece
    def initialize color, position
      super color, position
    end

    def movements
      %w[
        right_long_diagonal
        left_long_diagonal
      ]
    end
  end
end
