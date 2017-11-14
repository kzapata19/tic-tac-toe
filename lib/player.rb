# require_relative "board"
require 'pry'
class Player

  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

#player should not need to know about board ideally, if so we can place in initializer
  def mark_board(row, col, board)
    board.grid[row][col] = @mark
    board
  end

end
