require 'pry'
#rename to Results, Games Rules
class Game
  attr_reader :board

  def initialize(board)
    @board = board
  end

#extract to another class
  def display_board
    p board.grid
  end

#helper methods should be placed after the methods that use them
  def check_array_win(array)
    array.uniq.length == 1 && array.uniq[0] != nil
  end

  def check_horizontal_win
    winner = nil
    board.grid.each do |row|
      if check_array_win(row)
        winner = row[0]
      end
    end
    winner

  end

  def check_vertical_win
    winner = nil
    board.grid.each_index do |col|
      check_array = []
      board.grid.each do |row|
        check_array.push(row[col])
      end

      if check_array_win(check_array)
        winner = check_array[0]
      end
    end
    winner
  end

  def check_tie
    emptySpace = false
    board.grid.each do |row|
      row.any? do |e|
        emptySpace = emptySpace || e.nil?
      end
    end
    !check_winner && !emptySpace
  end

  def check_winner
    check_horizontal_win || check_vertical_win || check_diagonal_win
  end

  def check_main_diagonal_win
    winner = nil
    check_array = []
    target_index = 0
    board.grid.each do |row|
      check_array.push(row[target_index])
      target_index = target_index + 1
    end

    if check_array_win(check_array)
      winner = check_array[0]
    end
    winner
  end

  def check_antidiagonal_win
    winner = nil
    check_array = []
    target_index = board.grid.length - 1
    board.grid.each do |row|
      check_array.push(row[target_index])
      target_index = target_index - 1
    end

    if check_array_win(check_array)
      winner = check_array[0]
    end
    winner
  end

  def check_diagonal_win

    check_main_diagonal_win || check_antidiagonal_win

  end

end


