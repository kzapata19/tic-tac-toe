class Board

  attr_accessor :size, :grid

  def initialize(size=3)
    @size = size
    @grid = Array.new(size){Array.new(size)}
  end

end
