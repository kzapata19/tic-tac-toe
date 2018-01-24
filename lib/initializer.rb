class Initializer
  class VoidBoardSizeError < StandardError
  end

  attr_accessor :display, :board

  def initialize(display)
    @display = display
    @board = create_board
  end

  def get_board_size

    begin
      size = display.get_board_size
      if size < 3
        raise VoidBoardSizeError.new("Board size is invalid. Size must be a positive integer greater than 2. Try again...")
      end
    rescue VoidBoardSizeError=>e
      display.display_message(e.message)
      retry
    end
    size
  end

  def create_board
    Board.new(get_board_size)
  end

end
