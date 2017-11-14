# this class will make players and board interact
class GameSession

  attr_accessor :player1, :player2, :board, :rules, :display

  def initialize(player1, player2, board, rules, display)
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @board = Board.new(3, 3)
    @rules = Rules.new(@board)
    @display = Display.new(@board)
  end

  def start_game
    p "Welcome to TicTacToe! Player 1 is 'X' and Player 2 is 'O'."
  end

  #ask for player's coordinates
  #begin



  #run Rules.check_win

end