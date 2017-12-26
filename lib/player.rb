class Player

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

  def provide_move
    board_location = @input.gets.to_i
  end

  def provide_board_size
    board_size = @input.gets.to_i
    # if board_size.integer? && board_size > 2
    #   board_size
    # else
    #   raise VoidBoardSizeError.new("Board size must be a positive integer greater than 2.")
    # end
  end

end
