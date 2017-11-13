class Board

  attr_accessor :row, :column

  def initialize(row, column)
    @row = row
    @column = column
  end

  def build_board
    Array.new(row){Array.new(column)}
  end


end



