require 'pry'
#rename to Results, Games Rules
class Rules
  attr_reader :board

  def initialize(board)
    @board = board
  end

#helper methods should be placed after the methods that use them
  def array_win(array)
    array.uniq.length == 1 && array.uniq[0] != nil
  end

  def horizontal_win
    winner = nil
    board.grid.each do |row|
      if array_win(row)
        winner = row[0]
      end
    end
    winner

  end

  def vertical_win
    winner = nil
    board.grid.each_index do |col|
      array = []
      board.grid.each do |row|
        array.push(row[col])
      end

      if array_win(array)
        winner = array[0]
      end
    end
    winner
  end

  def tie
    emptySpace = false
    board.grid.each do |row|
      row.any? do |e|
        emptySpace = emptySpace || e.nil?
      end
    end
    !check_winner && !emptySpace
  end

  def check_winner
    horizontal_win || vertical_win || diagonal_win
  end

  def main_diagonal_win
    winner = nil
    array = []
    target_index = 0
    board.grid.each do |row|
      array.push(row[target_index])
      target_index = target_index + 1
    end

    if array_win(array)
      winner = array[0]
    end
    winner
  end

  def antidiagonal_win
    winner = nil
    array = []
    target_index = board.grid.length - 1
    board.grid.each do |row|
      array.push(row[target_index])
      target_index = target_index - 1
    end

    if array_win(array)
      winner = array[0]
    end
    winner
  end

  def diagonal_win

    main_diagonal_win || antidiagonal_win

  end

end


