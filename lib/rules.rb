class Rules

 def is_tie?(board_grid)
    emptySpace = false
    board_grid.each do |value|
      if value != "X" || value != "O"
        emptySpace = true
        break
      end
    end
    !winner?(board_grid) && !emptySpace
  end

  def winner?(board_grid)
    # methods return an empty array if no win
    horiz = get_horizontal_win(board_grid)
    vert = get_vertical_win(board_grid)
    diag = get_diagonal_win(board_grid)
    winner = false

    [horiz, vert, diag].each do |moves|
      if contains_winner?(moves)
        winner = get_mark(moves)
      end
    end
    winner
  end

  def get_horizontal_win(board_grid)
    horizontal_moves = []
    start = 0
    row_length = Math.sqrt(board_grid.length)
    target_row = board_grid[start, row_length]

    while start < board_grid.length
      if contains_winner?(target_row)
        horizontal_moves = target_row
        break
      else
        start = start + row_length
        target_row = board_grid[start, row_length]
      end
    end
    horizontal_moves
  end

  def get_vertical_win(board_grid)
    vertical_moves = []
    pointer = 0
    col_length = Math.sqrt(board_grid.length)

    while pointer < col_length

      board_grid.each_with_index do|value, index|
        if index == pointer
          vertical_moves.push(value)
        elsif index < pointer
          next
        elsif index % col_length == 0
          vertical_moves.push(value)
        end
      end

      if contains_winner?(vertical_moves)
        break
      else
        pointer = pointer + 1
      end
    end
    vertical_moves
  end

### NEEDS TO BE REFACTORED TO WORK FOR SINGLE ARRAY GRID

  # def diagonal_winning_mark
  #   get_main_diagonal_winning_mark || get_antidiagonal_winning_mark
  # end

  # def get_main_diagonal_winning_mark
  #   winner = nil
  #   array = []
  #   target_index = 0
  #   board.each do |row|
  #     array.push(row[target_index])
  #     target_index = target_index + 1
  #   end

  #   if get_mark(array)
  #     winner = array[0]
  #   end
  #   winner
  # end

  # def get_antidiagonal_winning_mark
  #   winner = nil
  #   array = []
  #   target_index = board.length - 1
  #   board.each do |row|
  #     array.push(row[target_index])
  #     target_index = target_index - 1
  #   end

  #   if get_mark(array)
  #     winner = array[0]
  #   end
  #   winner
  # end

  def contains_winner?(moves)
    moves.uniq.length == 1
  end

  def get_mark(moves)
    moves.uniq[0]
  end

end
