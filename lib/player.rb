require 'pry'
class Player

  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def provide_move(display1)
    location = gets.chomp.to_i
    if location.integer? && location.between?(1,9)
      location
    else
      display1.display_message("Please enter an integer between 1 and 9 (inclusive): ")
      provide_move(display1)
    end
  end

end
