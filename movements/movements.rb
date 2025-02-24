module Movements
  def long_vertical
    column, initial_line = position.split('')
    board.each do |line_index, line|
      next if line_index == initial_line
      permitted << "#{line_index}#{column}"
    end
  end

  def short_vertical
    column, initial_line = position.split('')
    board.each do |line_index, line|
      next if line_index == initial_line
      next unless (line_index.to_i - initial_line.to_i).abs == 1
      permitted << "#{column}#{line_index}"
    end
  end

  def double_short_vertical
    initial_column, initial_line = position.split('')
    board.each do |line_index, line|
      operation = piece.color == 'white' ? :<= : :>=
      next if line_index.to_i.send(operation, initial_line.to_i)
      next if (line_index.to_i - initial_line.to_i).abs > 2
      permitted << "#{initial_column}#{line_index}"
    end
  end

  def long_horizontal
    initial_column, initial_line = position.split('')
    board[initial_line].each_key do |column|
      next if column.to_s == initial_column
      permitted << "#{column}#{initial_line}"
    end
  end

  def short_horizontal
    initial_column, initial_line = position.split('')
    board[initial_line].each_key.each_with_index do |column, index|
      initial_column_index = board[initial_line].each_key.find_index { |item| item.to_s == initial_column }
      next unless (initial_column_index - index).abs == 1
      permitted << "#{column.to_s}#{initial_line}"
    end
  end

  def right_long_diagonal
    initial_column, initial_line = position.split('')
    board.each do |line_index, line|
      next if line_index == initial_line

      permitted << "#{initial_column}#{line_index}"
    end
  end

  def right_short_diagonal; end

  def left_long_diagonal; end

  def left_short_diagonal; end

  def right_foward; end

  def left_foward; end

  def right_backward; end

  def left_backward; end

  def foward_right; end

  def foward_left; end

  def backward_right; end

  def backward_left; end
end
