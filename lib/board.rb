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
    @grid = Array.new(@size){Array.new(@size)}
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

  # def create_grid
  #   Array.new(@size){Array.new(@size)}
  # end


  def create_board
    board = "\n"
    board_numbers = format_numbers
    # length = board_numbers.length

    board_numbers.each do |number|
      if (number.to_i) % @size == 0
        board = board + "_#{number}_|" + "\n\n"
      else
        board = board + "_#{number}_|"
      end
    end
    board
  end

  def prepend_leading_zero(number)
    "%02d" % number if number.digits.count == 1
  end

  def format_numbers
    @board_numbers.to_a.reduce([]) do|formatted, number|
      formatted.push(prepend_leading_zero(number) || number)
    end
  end

end
