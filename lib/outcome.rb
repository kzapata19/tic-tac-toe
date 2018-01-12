class Outcome

  def is_tie?(moves)
    if !empty_board_space?(board) && !winner?(board_grid)
      return true
    end
    false
  end

  def winner?(all_move_combos)
    winner = false
    all_move_combos.each do |set_of_moves|
      if set_of_moves.uniq.length == 1
        winner = true
        break
      end
    end
    winner
  end

# private
  # def contains_winner?(moves)
  #   moves.uniq.length == 1
  # end

  # def get_mark(moves)
  #   moves.uniq[0]
  # end

  # def get_horizontal_win(board_grid)
  #   horizontal_winning_moves = []
  #   start = 0
  #   row_length = Math.sqrt(board_grid.length)
  #   target_row = board_grid[start, row_length]

  #   while start < board_grid.length
  #     if contains_winner?(target_row)
  #       horizontal_winning_moves = target_row
  #       break
  #     else
  #       start = start + row_length
  #       target_row = board_grid[start, row_length]
  #     end
  #   end

  #   horizontal_winning_moves
  # end

  # def get_vertical_win(board_grid)
  #   vertical_winning_moves = []
  #   pointer = 0
  #   col_length = Math.sqrt(board_grid.length)

  #   while pointer < col_length

  #     board_grid.each_with_index do|value, index|
  #       if (index - pointer) % col_length == 0
  #         vertical_winning_moves.push(value)
  #       end
  #     end

  #     if contains_winner?(vertical_winning_moves)
  #       break
  #     else
  #       pointer = pointer + 1
  #       vertical_winning_moves = []
  #     end
  #   end

  #   vertical_winning_moves
  # end

  # def get_diagonal_win(board_grid)
  #   diagonal_winning_moves = [get_main_diagonal_win(board_grid), get_antidiagonal_win(board_grid)]

  #   diagonal_winning_moves.each do|moves|
  #     if contains_winner?(moves)
  #       diagonal_winning_moves = moves
  #       break
  #     else
  #       diagonal_winning_moves = []
  #     end
  #   end

  #   diagonal_winning_moves
  # end

  # def get_main_diagonal_win(board_grid)
  #   diagonal_winning_moves = []
  #   diagonal_length = Math.sqrt(board_grid.length)

  #   board_grid.each_with_index do|value, index|
  #     if (index + diagonal_length + 1) % (diagonal_length + 1) == 0
  #       diagonal_winning_moves.push(value)
  #     else
  #       next
  #     end
  #   end

  #   !contains_winner?(diagonal_winning_moves) ?
  #   diagonal_winning_moves = [] : diagonal_winning_moves
  # end

  # def get_antidiagonal_win(board_grid)
  #   diagonal_winning_moves = []
  #   diagonal_length = Math.sqrt(board_grid.length)

  #   board_grid.each_with_index do|value, index|
  #     if (diagonal_length - 1 - index) % (diagonal_length - 1) == 0 && index != 0 && index != board_grid.length - 1
  #       diagonal_winning_moves.push(value)
  #     else
  #       next
  #     end
  #   end

  #   !contains_winner?(diagonal_winning_moves)?
  #   diagonal_winning_moves = [] : diagonal_winning_moves
  # end



  # def empty_board_space?(moves)
  #   empty = false

  #   moves.each do|value|
  #     if value != 'X' && value != 'O'
  #       empty = true
  #     end
  #   end
  #   empty
  # end

end
