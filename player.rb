require_relative "board"

class Player

  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

end


# board_structure = {1 => [], 2 => [], 3 =>[]}
# my_board = Board.new(board_structure)

# puts my_board.board
# player_1 = Player.new("X")
# puts player_1
# puts player_1.mark

