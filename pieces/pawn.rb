require_relative 'piece'

module Pieces
  class Pawn < Piece
    def initialize color, position
      super color, position
    end

    def movements
      %w[
          short_vertical
          double_short_vertical
        ]
    end

    def atacks
      %w[
          right_short_diagonal
          left_short_diagonal
        ]
    end
  end
end
