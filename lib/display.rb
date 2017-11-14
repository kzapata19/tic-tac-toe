class Display

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def display_board
    print "
     _1_|_2_|_3_\n
        |   |
     _4_|_5_|_6_\n
        |   |
     _7_|_8_|_9_\n"
  end


end
