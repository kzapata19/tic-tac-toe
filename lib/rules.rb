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

      contains_winner?(vertical_moves) ? break : pointer += 1

    end

    vertical_moves
  end

  def get_diagonal_win(board_grid)
    diagonal_moves = [get_main_diagonal_win(board_grid), get_antidiagonal_win(board_grid)]

    diagonal_moves.each do|moves|
      if contains_winner?(moves)
        diagonal_moves = moves
      else
        diagonal_moves = []
      end
    end

    diagonal_moves
  end

  def get_main_diagonal_win(board_grid)
    diagonal_moves = []
    diagonal_length = Math.sqrt(board_grid.length)

    board_grid.each_with_index do|value, index|
      if (index + diagonal_length + 1) % (diagonal_length + 1) == 0
        diagonal_moves.push(value)
      else
        next
      end
    end

    diagonal_moves
  end

  def get_antidiagonal_win(board_grid)
    diagonal_moves = []
    diagonal_length = Math.sqrt(board_grid.length)

    board_grid.each_with_index do|value, index|
      if (diagonal_length - 1 - index) % (diagonal_length - 1) == 0 && index != 0 && index != board_grid.length - 1
        diagonal_moves.push(value)
      else
        next
      end
    end

    diagonal_moves
  end

  def contains_winner?(moves)
    moves.uniq.length == 1
  end

  def get_mark(moves)
    moves.uniq[0]
  end

end
