class Player

  attr_reader :mark, :input

  def initialize(mark, input=STDIN)
    @mark = mark
    @input = input
  end

  def provide_move
    #move to Display class?
    board_location = @input.gets.to_i
  end

end
