class Initializer
  class VoidBoardSizeError < StandardError
    # attr_reader :action
    # def initialize(message)
    #   # call parent's constructor to set the message
    #   super(message)
    #   # store action in instance variable
    #   # @action = action
    # end
  end

  attr_accessor :input, :output, :board

  def initialize(input=STDIN, output=STDOUT)
    @input = input
    @output = output
    @board = Board.new(get_board_size)
  end

  def get_board_size
    size = 0
    @output.print "Please provide a number for the board size to build a proportional board: "
    until size >= 3
      begin
        size = @input.gets.to_i
        raise VoidBoardSizeError.new("Board size '#{size}' is invalid. Size must be a positive integer greater than 2. Try again...")
      rescue VoidBoardSizeError=>e
        @output.print "#{e.message}\n"
      end
    end
    size
  end

end
