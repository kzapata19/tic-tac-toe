class Board

  attr_accessor :row, :column, :grid
# in future think about 1-D array?
  def initialize(row, column)
    @row = row
    @column = column
    @grid = Array.new(row){Array.new(column)}
  end

  def get_mark(row, col)
    grid[row][col]
  end

end
