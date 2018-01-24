class Board

  attr_accessor :size, :grid

  def initialize(size)
    @size = size
    @grid = (1..@size**2).to_a
  end

  def update_grid(location, mark)
    converted_location = location - 1

    if location.integer? && location.between?(1, @grid.size)
      @grid[converted_location] = mark
      @grid
    end
  end

  def full?(board_grid)
    board_grid.uniq.length == 2
  end

  def get_all_move_combos
    combinations = [get_all_rows, get_all_columns, get_diagonals]

    combinations.flatten(1)
  end

  def get_all_rows
    horizontal_moves = []
    start = 0
    row_length = @size
    target_row = @grid[start, row_length]

    while start < @grid.length
      target_row = @grid[start, row_length]
      horizontal_moves.push(target_row)
      start = start + row_length
    end

    horizontal_moves
  end

  def get_all_columns
    vertical_moves = []
    pointer = 0
    col_length = @size

    while pointer < col_length
      col = []
      @grid.each_with_index do|value, index|
        if (index - pointer) % col_length == 0
          col.push(value)
        end
      end

      pointer = pointer + 1
      vertical_moves.push(col)
      col = []
    end

    vertical_moves
  end

  def get_diagonals
    [get_main_diagonal, get_antidiagonal]
  end

  def get_antidiagonal
    diagonal_moves = []
    @diagonal_length = @size

    @grid.each_with_index do|value, index|
      if on_antidiagonal_row?(index)
        diagonal_moves.push(value)
      else
        next
      end
    end
    diagonal_moves
  end

  def get_main_diagonal
    diagonal_moves = []
    @diagonal_length = @size

    @grid.each_with_index do|value, index|
      if on_main_diagonal_row?(index)
        diagonal_moves.push(value)
      else
        next
      end
    end

    diagonal_moves
  end

private
  def on_antidiagonal_row?(index)
    (@diagonal_length - 1 - index) % (@diagonal_length - 1) == 0 && index != 0 && index != @grid.length - 1
  end

  def on_main_diagonal_row?(index)
    (index + @diagonal_length + 1) % (@diagonal_length + 1) == 0
  end

end
