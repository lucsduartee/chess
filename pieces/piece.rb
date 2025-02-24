module Pieces
  class Piece
    attr_accessor :color, :position, :name

    def initialize(color, position)
      @color = color
      @position = position
    end

    def name
      self.class.to_s
    end

    def movements
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    def atacks
      movements
    end
  end
end
