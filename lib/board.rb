class Board

  class VoidBoardSizeError < StandardError
    attr_reader :action

    def initialize(message)
      # call parent's constructor to set the message
      super(message)
      # store action in instance variable
      # @action = action
    end

  end

  attr_accessor :size, :grid, :board_numbers, :game_board

  def initialize(size=3)
    @size = size
    # self.check_board_size
    @grid = create_grid
    @board_numbers = (1..@size**2).to_a
    @game_board = create_board
  end

  def check_board_size
    if @size < 3
      begin
        raise VoidBoardSizeError.new("Board size must be positive integer greater than 2.")
      rescue VoidBoardSizeError => e
        puts e.message
      end
    end
  end

  def create_grid
    Array.new(@size){Array.new(@size)}
  end

  def create_board
    board = "\n"
    length = @board_numbers.length
    length.times do |number|
      if (number + 1) % @size == 0
        board = board + "_#{number + 1}_|" + "\n\n"
      else
        board = board + "_#{number + 1}_|"
      end
    end
    board
  end

end
