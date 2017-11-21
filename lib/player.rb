require 'pry'
class Player

  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def provide_move
    location = gets.chomp.to_i
  end

end
