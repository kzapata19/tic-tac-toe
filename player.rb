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
    else
      "space occupied, find a new location"
    end

  end

end
