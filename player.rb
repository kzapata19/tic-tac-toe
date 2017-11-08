require_relative "board"

class Player

  attr_reader :mark
  attr_accessor :board

  def initialize(board, mark)
    @board = board
    @mark = mark
  end


  def find_target_location(row, column)
    board[row][column]
  end

  def mark_board(row, column)
    space = find_target_location(row, column)
    if space == nil
      board[row][column] = mark
      "successfully marked board"
    end
  end

end

# board_structure = {1 => [], 2 => [], 3 =>[]}
# my_board = Board.new(board_structure)
# karen = Player.new(board_structure, "X")
# # # puts karen
# puts karen.board
# # puts karen.find_target_location(1,0)
# puts karen.mark_board(1,0)
#  # karen.board[1][0] = "X"
# puts karen.board




## transfer these methods to Player class

# # # make method below private
# #   def get_target_row(row)
# #     board[row]
# #   end

# # # make method below private
# #   def find_target_location(row, column)
# #     get_target_row(row)[column]
# #   end

# #   def mark_board(symbol, row, column)

# #     location = find_target_location(row, column)

# #     if location == nil
# #       get_target_row(row)[column] = symbol
# #       "successfully placed '#{symbol}'"
# #     # later refactor else block to execute play until location is available
# #     else
# #       "space occupied, provide a new location"
# #     end