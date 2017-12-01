class Rules
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def get_winning_mark
    get_horizontal_winning_mark || get_vertical_winning_mark || get_diagonal_winning_mark
  end

  def is_tie?
    emptySpace = false
    board.grid.each do |row|
      row.any? do |e|
        emptySpace = emptySpace || e.nil?
      end
    end
    !get_winning_mark && !emptySpace
  end

  private
  def get_horizontal_winning_mark
    winner = nil
    board.grid.each do |row|
      if get_mark(row)
        winner = row[0]
      end
    end
    winner

  end

  def get_vertical_winning_mark
    winner = nil
    board.grid.each_index do |col|
      array = []
      board.grid.each do |row|
        array.push(row[col])
      end

      if get_mark(array)
        winner = array[0]
      end
    end
    winner
  end

  def get_diagonal_winning_mark
    get_main_diagonal_winning_mark || get_antidiagonal_winning_mark
  end

  def get_main_diagonal_winning_mark
    winner = nil
    array = []
    target_index = 0
    board.grid.each do |row|
      array.push(row[target_index])
      target_index = target_index + 1
    end

    if get_mark(array)
      winner = array[0]
    end
    winner
  end

  def get_antidiagonal_winning_mark
    winner = nil
    array = []
    target_index = board.grid.length - 1
    board.grid.each do |row|
      array.push(row[target_index])
      target_index = target_index - 1
    end

    if get_mark(array)
      winner = array[0]
    end
    winner
  end

  def get_mark(moves)
    moves.uniq.length == 1 && moves.uniq[0] != nil
  end



end
