require_relative './charge'
require 'pp'
# require 'pry'

class Board
  class << self
    def init
      all_pieces.reduce(empty_board) do |board, piece|
        column, line = piece.position.split ''
        board[line][column.to_sym] = piece
        board
      end
    end

    def prettify board
      prettified = board.transform_values { |column| column.dup }
      prettified.each do |line, column|
        next if column.each_value.all? { |position| position == ' ' }
        column.each do |k, v|
          column[k] = v if column[k] == ' '
          column[k] = v.color + '_' + v.name.split('::')[1].downcase unless column[k] == ' '
        end
      end
      prettified
    end

    private

    def empty_board
      {
        '1' => { :a => ' ', :b => ' ', :c => ' ', :d => ' ', :e => ' ', :f => ' ', :g => ' ', :h => ' ' },
        '2' => { :a => ' ', :b => ' ', :c => ' ', :d => ' ', :e => ' ', :f => ' ', :g => ' ', :h => ' ' },
        '3' => { :a => ' ', :b => ' ', :c => ' ', :d => ' ', :e => ' ', :f => ' ', :g => ' ', :h => ' ' },
        '4' => { :a => ' ', :b => ' ', :c => ' ', :d => ' ', :e => ' ', :f => ' ', :g => ' ', :h => ' ' },
        '5' => { :a => ' ', :b => ' ', :c => ' ', :d => ' ', :e => ' ', :f => ' ', :g => ' ', :h => ' ' },
        '6' => { :a => ' ', :b => ' ', :c => ' ', :d => ' ', :e => ' ', :f => ' ', :g => ' ', :h => ' ' },
        '7' => { :a => ' ', :b => ' ', :c => ' ', :d => ' ', :e => ' ', :f => ' ', :g => ' ', :h => ' ' },
        '8' => { :a => ' ', :b => ' ', :c => ' ', :d => ' ', :e => ' ', :f => ' ', :g => ' ', :h => ' ' },
      }
    end

    def black_pieces
      black_pawns + pieces('black', '8')
    end

    def white_pieces
      white_pawns + pieces('white', '1')
    end

    def black_pawns
      %w[a b c d e f g h].map do |column|
        Pieces::Pawn.new 'black', "#{column}7"
      end
    end

    def white_pawns
      %w[a b c d e f g h].map do |column|
        Pieces::Pawn.new 'white', "#{column}2"
      end
    end

    def all_pieces
      white_pieces + black_pieces
    end

    def pieces color, line
      [
        ['a', 'rook'],
        ['b', 'knight'],
        ['c', 'bishop'],
        ['d', 'queen'],
        ['e', 'king'],
        ['f', 'bishop'],
        ['g', 'knight'],
        ['h', 'rook'],
      ].map do |piece|
        Pieces.const_get(piece[1].capitalize).new color, "#{piece[0] + line}"
      end
    end

    def charge
      all_pieces.reduce(empty_board) do |board, piece|
        column, line = piece.position.split ''
        board[line][column.to_sym] = piece
        board
      end
    end
  end
end
