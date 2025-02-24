require_relative 'piece'

module Pieces
  class King < Piece
    def initialize color, position
      super color, position
    end

    def movements
      %w[
          short_vertical
          short_horizontal
          right_short_diagonal
          left_short_diagonal
        ]
    end
  end
end
