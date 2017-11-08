class Board

  attr_accessor :board

  def initialize(board)
    @board = board
  end

# make method below private
  def get_target_row(row)
    board[row]
  end

# make method below private
  def find_target_location(row, column)
    get_target_row(row)[column]
  end

  def mark_board(symbol, row, column)

    location = find_target_location(row, column)

    if location == nil
      get_target_row(row)[column] = symbol
      "successfully placed '#{symbol}'"
    # later refactor else block to execute play until location is available
    else
      "space occupied, provide a new location"
    end

  end

end

# board_structure = {1 => [], 2 => [], 3 =>[]}
# my_board = Board.new(board_structure)

# puts my_board
# puts my_board.find_target_location(1,0)
# puts my_board.mark_board("X", 1, 0)
# puts my_board.board
