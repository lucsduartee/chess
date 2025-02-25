require_relative 'piece'

module Pieces
  class Pawn < Piece
    attr_accessor :already_move

    def initialize color, position
      super color, position
      @already_move = false
    end

    def movements
      %w[
          pawn_short_vertical
          pawn_double_short_vertical
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
