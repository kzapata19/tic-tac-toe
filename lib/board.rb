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

  attr_accessor :size, :grid, :board_numbers, :game_board

  def initialize(size=3)
    @size = size
    self.check_board_size
    @grid = Array.new(@size**2)
    @board_numbers = (1..@size**2).to_a
    @game_board = create_board
  end

  def check_board_size
    raise VoidBoardSizeError.new("Board size must be a positive integer greater than 2.") if @size < 3
  end

  def create_board
    board = "\n"
    board_numbers = format_numbers
    #use @board numbers, check if number then prepend 0 otherwise, do nothing to player's mark

    board_numbers.each do |number|
      if (number.to_i) % @size == 0
        board = board + "_#{number}_|" + "\n\n"
      else
        board = board + "_#{number}_|"
      end
    end
    board
  end

  # def label_board_spaces
  #   board = "\n"
  #   board_numbers = format_numbers
  #   length = @board_numbers.size

  #   board_numbers.each_with_index do |space_val, index|
  #     if (Math.sqrt(index) % length) == 0
  #       board = board + "_#{}"
  #   end
  # end

  # def update_grid
  #   @grid.each
  # end

  def format_numbers
    @board_numbers.reduce([]) do|formatted, number|
      formatted.push(prepend_leading_zero(number) || number)
    end
  end

  def prepend_leading_zero(number)
    "%02d" % number if number.digits.count == 1
  end

end
