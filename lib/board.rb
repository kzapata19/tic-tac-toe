class Board

  attr_accessor :size, :grid

  def initialize(size)
    @size = size
    @grid = Array.new(size){Array.new(size)}
  end

  def get_mark(row, col)
    grid[row][col]
  end

end
