require_relative 'piece'

module Pieces
  class Knight < Piece
    def initialize color, position
      super color, position
    end

    def movements
      %w[
          right_foward
          left_foward
          right_backward
          left_backward
          foward_right
          foward_left
          backward_right
          backward_left
        ]
    end
  end
end
