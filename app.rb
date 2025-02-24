require 'pp'
require 'json'
require 'erb'
require_relative 'board/board'
require_relative 'board/charge'
require_relative 'movements/movement'
require_relative 'movements/available_positions'
require_relative 'movements/permitted_moves'

board = Board.init

def render_board(board)
  Board.prettify(board)
end

turn = 'white'

while true
  p "#{turn} turn"
  rendered = render_board(board)

  template = File.read('home.erb')
  rederer = ERB.new(template)
  html = rederer.result(binding)
  File.write("pagina.html", html)

  puts 'Pick piece'
  piece_position = gets.chomp

  column, line = piece_position.split ''
  piece = board[line][column.to_sym]

  puts "Move #{piece.color + ' ' + piece.name} to:"
  position = gets.chomp

  template = File.read('home.erb')
  rederer = ERB.new(template)
  html = rederer.result(binding)
  File.write("pagina.html", html)

  p "Moving piece from #{piece_position} to #{position}"
  board = Movement.call(board, piece, position)

  turn = turn == 'white' ? 'black' : 'white'
  p "====================================================================="
end
