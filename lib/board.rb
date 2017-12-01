class Board

  attr_reader :size
  attr_accessor :grid

  def initialize(size=3)
    @size = size
    @grid = Array.new(size){Array.new(size)}
  end

end
