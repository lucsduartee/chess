require 'pp'
require 'json'
require 'erb'
require_relative 'board/board'
require_relative 'board/charge'
require_relative 'movements/movement'
require_relative 'movements/available_positions'
require_relative 'movements/permitted_moves'

board = Board.init
piece = board['7'][:a]
test = PermittedMoves.call(piece, board)
p test, "before"
board = Movement.call(board, piece, 'a6')

test = PermittedMoves.call(board['6'][:a], board)
p test, "after"
