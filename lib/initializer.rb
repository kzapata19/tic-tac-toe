class Initializer
  attr_accessor :input, :output, :board

  def initialize(input=STDIN, output=STDOUT)
    @input = input
    @output = output
    @board = Board.new(get_board_size)
  end

  def get_board_size
    @output.print "Please provide a number for the board size to build a proportional board: "
    @input.gets.to_i
  end

end
