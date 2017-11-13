require 'pry'

class Game
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def display_board
    p board.grid
  end

  def check_win(array)
    array.uniq.length == 1 && array.uniq[0] != nil
  end

  def has_horizontal_win
    winner = false
    board.grid.each do |row|
      if check_win(row)
        winner = true
      end
    end
    winner
  end

  def has_vertical_win
    winner = false
    board.grid.each_index do |col|
      check_array = []
      board.grid.each do |row|
        check_array.push(row[col])
      end

      if check_win(check_array)
        winner = true
      end
    end
    winner
  end

  def has_diagonal_win
    winner = false
    check_array = []
    target_index = 0
    board.grid.each do |row|
      check_array.push(row[target_index])
      target_index = target_index + 1
    end

    if check_win(check_array)
      winner = true
    end

    if !winner
      check_array = []
      target_index = board.grid.length - 1
      board.grid.each do |row|
        check_array.push(row[target_index])
        target_index = target_index - 1
      end

      if check_win(check_array)
        winner = true
      end
    end

    winner

  end

end


