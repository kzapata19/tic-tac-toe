class Display

  attr_reader :board, :output, :board_numbers

  def initialize(board, output=STDOUT)
    @board = board
    @output = output
    @board_numbers = (1..board.size**2).to_a
  end

  def display_board
    display_message(
     "\n_#{@board_numbers[0]}_|_#{@board_numbers[1]}_|_#{@board_numbers[2]}_\n\n_#{@board_numbers[3]}_|_#{@board_numbers[4]}_|_#{@board_numbers[5]}_\n\n_#{@board_numbers[6]}_|_#{@board_numbers[7]}_|_#{@board_numbers[8]}_\n\n")
  end

  def display_message(msg)
    @output.print msg
  end

end
