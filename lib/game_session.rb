# this class will make players and board interact
class GameSession

  attr_accessor :player1, :player2, :board, :rules, :display

  def initialize(player1, player2, board, rules, display)
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @board = Board.new(3, 3)
    @rules = Rules.new(@board)
    @display = Display.new(@board)
    # self.start_game
    self.translate_move_to_indexes
  end

  def start_game
    p "Welcome to TicTacToe! Player 1 is 'X' and Player 2 is 'O'."
  end

  def provide_move(location, player)
    update_board_grid(location, player)
    update_display_board(location, player)
    @display.display_board
  end

  def update_display_board(location, player)
    @display.display_array[location - 1] = player.mark
  end

  def update_board_grid(location, player)



  end

  def translate_move_to_indexes
    translator = {}
    key = 1
    column_length = (1..3).to_a
    row_length = (1..3).to_a

    row_length.each do |row|
      column_length.each do |col|
        translator[key] = [(row - 1), (col - 1)]
        key = key + 1
      end
    end
    print translator
  end

  #run Rules.check_win

end
