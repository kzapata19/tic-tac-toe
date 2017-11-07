class Board

  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def get_target_row(row)
    board[row]
  end

  def find_target_location(row, column)
    get_target_row(row)[column]
  end

  def play(symbol, row, column)

    location = find_target_location(row, column)

    if location == nil
      get_target_row(row)[column] = symbol
      "successfully placed '#{symbol}'"
    else
      "space occupied, provide a new location"
    end

  end

end

# board_structure = {1 => [], 2 => [], 3 =>[]}
# my_board = Board.new(board_structure)

# puts my_board
# puts my_board.find_target_location(1,0)
# puts my_board.play("X", 1, 0)
# puts my_board.board
