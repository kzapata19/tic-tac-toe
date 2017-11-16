require 'pry'

class Rules
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def get_winning_mark
    is_horizontal_win || is_vertical_win || is_diagonal_win
  end

  def is_horizontal_win
    winner = nil
    board.grid.each do |row|
      if array_win(row)
        winner = row[0]
      end
    end
    winner

  end

  def is_vertical_win
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

  def is_diagonal_win
    is_main_diagonal_win || is_antidiagonal_win
  end

  def is_main_diagonal_win
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

  def is_antidiagonal_win
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

  def array_win(array)
    array.uniq.length == 1 && array.uniq[0] != nil
  end

  def is_tie
    emptySpace = false
    board.grid.each do |row|
      row.any? do |e|
        emptySpace = emptySpace || e.nil?
      end
    end
    !get_winning_mark && !emptySpace
  end

end
