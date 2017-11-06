class Board

  def board
    {1 => [], 2 => [], 3 => []}
  end

  def get_row(row_num)
    one_board = board
    puts one_board[row_num]
  end

  # def get_target_location(row, column)
    # get_row(row)
  # end

  def row_length (row)
    row.length
  end

  def empty_board? (board)
    empty = 0

    board.each do |key, row|
      empty = row_length(row) + empty
    end

    empty == 0
  end

  # def add_mark(mark, row, column)

  # end

  # def print_board(board)

  # end

end
