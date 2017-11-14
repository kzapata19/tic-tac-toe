class Display

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def display_board
    p board.grid
  end

end
