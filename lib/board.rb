class Board

  class InvalidBoardSizeError < StandardError
    # attr_reader :action

    # def initialize(message)
    #   # call parent's constructor to set the message
    #   super(message)
    #   # @action = action
    # end

  end

  attr_accessor :size, :grid

  def initialize(size=3)
    @size = size
    @grid = create_grid
  end

  def create_grid
    raise InvalidBoardSizeError.new("Invalid board size") if @size < 2
    Array.new(@size){Array.new(@size)}
  end

end

# board1 = Board.new(1)
# p board1.grid
# p board1.create_grid