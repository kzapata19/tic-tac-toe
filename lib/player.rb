class Player

  class VoidMove < StandardError
  end

  class VoidBoardSize < StandardError
  end

  attr_reader :mark, :input

  def initialize(mark, input=STDIN)
    @mark = mark
    @input = input
  end

  def provide_move(size)
    board_location = @input.gets.to_i
    if board_location.integer? && board_location.between?(1, size)
      board_location
    else
      raise VoidMove
    end
  end

  def provide_board_size
    board_size = @input.gets.to_i
    if board_size.integer? && board_size > 2
      board_size
    # else
    #   raise VoidBoardSize
    end
  end

end
