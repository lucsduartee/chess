require_relative 'piece'

module Pieces
  class Rook < Piece
    def initialize color, position
      super color, position
    end

    def movements
      %w[
          long_vertical
          long_horizontal
        ]
    end
  end
end
