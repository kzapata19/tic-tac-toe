class Board

  attr_accessor :board

  def initialize(board)
    @board = board
  end

end

# # make method below private
#   def get_target_row(row)
#     board[row]
#   end

# # make method below private
#   def find_target_location(row, column)
#     get_target_row(row)[column]
#   end

#   def mark_board(symbol, row, column)

#     location = find_target_location(row, column)

#     if location == nil
#       get_target_row(row)[column] = symbol
#       "successfully placed '#{symbol}'"
#     # later refactor else block to execute play until location is available
#     else
#       "space occupied, provide a new location"
#     end

#   end