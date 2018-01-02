class Board

  class VoidBoardSizeError < StandardError
    # attr_reader :action

    def initialize(message)
      # call parent's constructor to set the message
      super(message)
      # store action in instance variable
      # @action = action
    end

  end

  class VoidMoveError < StandardError
    def initialize(message)
      super(message)
    end
  end

  attr_accessor :size, :grid

  def initialize(size)
    @size = size
    self.check_board_size
    @grid = (1..@size**2).to_a
  end

  def check_board_size
    raise VoidBoardSizeError.new("Board size must be a positive integer greater than 2.") if @size < 3
  end

#public method used by Game Session
  def update_grid(location, mark)
    converted_location = location - 1

    if location.integer? && location.between?(1, @grid.size)
      @grid[converted_location] = mark
      @grid
    else
      raise VoidMoveError.new("Provide a number between 1 and #{@grid.size} inclusive")
    end
  end

end
