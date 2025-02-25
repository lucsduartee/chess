module Movements
  COLUMNS = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'].freeze

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

  def pawn_short_vertical
    initial_column, initial_line = position.split('')
    next_line = piece.color == 'white' ? initial_line.to_i + 1 : initial_line.to_i - 1
    permitted << "#{initial_column}#{next_line}" if next_line.between?(1, 8)
  end

  def pawn_double_short_vertical
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
    col_index = COLUMNS.index(initial_column)
    line = initial_line.to_i

    while col_index < COLUMNS.size - 1 && line < 8
      col_index += 1
      line += 1
      permitted << "#{COLUMNS[col_index]}#{line}"
    end

    col_index = COLUMNS.index(initial_column)
    line = initial_line.to_i

    while col_index < COLUMNS.size - 1 && line > 1
      col_index += 1
      line -= 1
      permitted << "#{COLUMNS[col_index]}#{line}"
    end
  end

  def right_short_diagonal
    initial_column, initial_line = position.split('')
    col_index = COLUMNS.index(initial_column)
    line = initial_line.to_i
    next_col = COLUMNS[col_index + 1]
    next_line = line + 1

    if next_col && next_line <= 8
      permitted << "#{next_col}#{next_line}"
    end

    next_line = line - 1
    if next_col && next_line >= 1
      permitted << "#{next_col}#{next_line}"
    end
  end

  def left_long_diagonal
    initial_column, initial_line = position.split('')
    col_index = COLUMNS.index(initial_column)
    line = initial_line.to_i

    while col_index > 0 && line < 8
      col_index -= 1
      line += 1
      permitted << "#{COLUMNS[col_index]}#{line}"
    end

    col_index = COLUMNS.index(initial_column)
    line = initial_line.to_i

    while col_index > 0 && line > 1
      col_index -= 1
      line -= 1
      permitted << "#{COLUMNS[col_index]}#{line}"
    end
  end

  def left_short_diagonal
    initial_column, initial_line = position.split('')
    col_index = COLUMNS.index(initial_column)
    line = initial_line.to_i
    prev_col = COLUMNS[col_index - 1]
    next_line = line + 1

    if prev_col && next_line <= 8
      permitted << "#{prev_col}#{next_line}"
    end

    next_line = line - 1
    if prev_col && next_line >= 1
      permitted << "#{prev_col}#{next_line}"
    end
  end

  def right_foward
    initial_column, initial_line = position.split('')
    next_column = (initial_column.ord + 2).chr
    next_line = initial_line.to_i - 1
    can_add_number = initial_line != '1' && COLUMNS.include?(next_column)
    permitted << "#{next_column + next_line.to_s}" if can_add_number
  end

  def left_foward
    initial_column, initial_line = position.split('')
    next_column = (initial_column.ord - 2).chr
    next_line = initial_line.to_i - 1
    can_add_number = initial_line != '1' && COLUMNS.include?(next_column)
    permitted << "#{next_column + next_line.to_s}" if can_add_number
  end

  def right_backward
    initial_column, initial_line = position.split('')
    next_column = (initial_column.ord + 2).chr
    next_line = initial_line.to_i + 1
    can_add_number = initial_line != '8' && COLUMNS.include?(next_column)
    permitted << "#{next_column + next_line.to_s}" if can_add_number
  end

  def left_backward
    initial_column, initial_line = position.split('')
    next_column = (initial_column.ord - 2).chr
    next_line = initial_line.to_i + 1
    can_add_number = initial_line != '8' && COLUMNS.include?(next_column)
    permitted << "#{next_column + next_line.to_s}" if can_add_number
  end

  def foward_right
    initial_column, initial_line = position.split('')
    next_column = (initial_column.ord + 1).chr
    next_line = initial_line.to_i - 2
    can_add_number = initial_line != '1' && COLUMNS.include?(next_column)
    permitted << "#{next_column + next_line.to_s}" if can_add_number
  end

  def foward_left
    initial_column, initial_line = position.split('')
    next_column = (initial_column.ord - 1).chr
    next_line = initial_line.to_i - 2
    can_add_number = initial_line != '1' && COLUMNS.include?(next_column)
    permitted << "#{next_column + next_line.to_s}" if can_add_number
  end

  def backward_right
    initial_column, initial_line = position.split('')
    next_column = (initial_column.ord + 1).chr
    next_line = initial_line.to_i + 2
    can_add_number = initial_line != '8' && COLUMNS.include?(next_column)
    permitted << "#{next_column + next_line.to_s}" if can_add_number
  end

  def backward_left
    initial_column, initial_line = position.split('')
    next_column = (initial_column.ord - 1).chr
    next_line = initial_line.to_i + 2
    can_add_number = initial_line != '8' && COLUMNS.include?(next_column)
    permitted << "#{next_column + next_line.to_s}" if can_add_number
  end
end
