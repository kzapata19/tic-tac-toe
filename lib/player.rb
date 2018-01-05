class Player

  attr_accessor :mark, :input

  def initialize(mark, input=STDIN)
    @mark = mark
    @input = input
  end

  def provide_move
    board_location = @input.gets.to_i
  end

  def provide_board_size
    board_size = @input.gets.to_i
  end

end
