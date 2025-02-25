class Movement
  attr_reader :board

  def self.call(*args) = new(*args).call

  def initialize board, piece, target_piece_position
    @board = board
    @piece = piece
    @target_piece_position = target_piece_position
  end

  def call
    clear_current_position
    move_piece
    reload_piece_position
    board
  end

  private

  attr_reader :piece, :target_piece_position

  def clear_current_position
    board[current_piece_line][current_piece_column.to_sym] = ' '
  end

  def move_piece
    piece.already_move = true if piece.name.include?('Pawn')
    board[target_piece_line][target_piece_column.to_sym] = piece
  end

  def reload_piece_position
    piece.position = "#{target_piece_column + target_piece_line}"
  end

  def split_position(position)
    position.split ''
  end

  def current_piece_column
    column, * = split_position(piece.position)
    column
  end

  def current_piece_line
    *, line = split_position(piece.position)
    line
  end

  def target_piece_column
    column, * = split_position(target_piece_position)
    column
  end

  def target_piece_line
    *, line = split_position(target_piece_position)
    line
  end
end
