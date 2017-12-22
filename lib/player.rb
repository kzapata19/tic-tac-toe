class Player

  class VoidMoveError < StandardError
    def initialize(message)
      super(message)
    end
  end

  class VoidBoardSizeError < StandardError
    def initialize(message)
      super(message)
    end
  end

  attr_accessor :mark, :input

  def initialize(mark, input=STDIN)
    @mark = mark
    @input = input
  end

  def provide_move(size)
    board_location = @input.gets.to_i
    if board_location.integer? && board_location.between?(1, size)
      board_location
    else
      raise VoidMoveError.new("Provide a number between 1 and #{size} inclusive")
    end
  end

  def provide_board_size
    board_size = @input.gets.to_i
    if board_size.integer? && board_size > 2
      board_size
    else
      raise VoidBoardSizeError.new("Board size must be a positive integer greater than 2.")
    end
  end

end
