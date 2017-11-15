class Display

  attr_reader :board
  attr_accessor :display_array

  def initialize(board)
    @board = board
    @display_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_board
    # Add print for playing in terminal

   "
     _#{@display_array[0]}_|_#{@display_array[1]}_|_#{@display_array[2]}_\n
        |   |
     _#{@display_array[3]}_|_#{@display_array[4]}_|_#{@display_array[5]}_\n
        |   |
     _#{@display_array[6]}_|_#{@display_array[7]}_|_#{@display_array[8]}_\n"
  end


end
