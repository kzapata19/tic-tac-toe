class Board

  def create_board
    {1 => ["X","O","X"], 2 => [nil, "O"], 3 => [nil, "X"]}
  end

  def get_row(row_num)
    create_board[row_num]
  end

  # def get_target_location(row, column)
    # get_row(row)
  # end

  def row_length(row)
    get_row(row).length
  end

  # def iterate_board(board, method_name)
  #   the_board = create_board
  #   the_board.each do |row_key, row|
  #     method_name(row_key, row)
  #   end
  # end

  def empty_board(board)
    empty = 0

    create_board.each do |key, row|
      empty = row_length(row) + empty
    end

    empty == 0
  end

  # def add_mark(mark, row, column)

  # end

  # def print_board(board)

  # end

end
