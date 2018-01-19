class Initializer
  class VoidBoardSizeError < StandardError
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
      begin
        size = @input.gets.to_i
        if size < 3
          raise VoidBoardSizeError.new("Board size '#{size}' is invalid. Size must be a positive integer greater than 2. Try again...")
        end
      rescue VoidBoardSizeError=>e
        @output.print "#{e.message}\n"
        retry
      end
    size
  end

end
