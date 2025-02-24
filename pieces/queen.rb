require_relative 'piece'

module Pieces
  class Queen < Piece
    def initialize color, position
      super color, position
    end

    def movements
      %w[
          long_vertical
          long_horizontal
          right_long_diagonal
          left_long_diagonal
        ]
    end
  end
end
