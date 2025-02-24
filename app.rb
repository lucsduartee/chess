require 'pp'
require 'json'
require_relative 'board/board'
require_relative 'board/charge'
require_relative 'movements/movement'
require_relative 'movements/available_positions'
require_relative 'movements/permitted_moves'

board = Board.init
piece = board['7'][:a] # knight

position = PermittedMoves.call(piece, board)[1]
board = Movement.call(board, piece, position)
p "board", board['1']

# turn = 'white'
# while true
#   puts

#   p "#{turn} turn"
#   sleep 1.5

#   pp Board.prettify board

#   puts

#   puts 'Pick piece'
#   piece_position = gets.chomp

#   column, line = piece_position.split ''
#   piece = board[line][column.to_sym]

#   puts "Move #{piece.color + ' ' + piece.name} to:"
#   position = gets.chomp

#   board = Movement.new(board, piece, position).move
#   p "Moving piece from #{piece_position} to #{position}"

#   turn = turn == 'white' ? 'black' : 'white'
#   sleep 1.5
#   puts

#   p "====================================================================="
# end
