# this class will make orchestrate interactions between all classes
class GameSession

  attr_accessor :player1, :player2, :board, :rules, :display, :translator, :current_player

  def initialize(player1, player2, board, rules, display)
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @board = Board.new(3, 3)
    @rules = Rules.new(@board)
    @display = Display.new(@board)
    @translator = setup_translator
    @current_player = @player1
    # binding.pry
    self.start_game

  end

  def start_game
    p "Welcome to TicTacToe! Player 1 is 'X' and Player 2 is 'O'."
    @display.display_board
    # provide_move(@current_player) #comment for testing purposes
  end

  def provide_move(player)
    print "Player #{player.mark}'s turn: "
    location = 1 # this is harcoded for testing purposes only - remove at end of project
    # location = gets.chomp.to_i #comment for testing purposes
    update_board_grid(location, player)
    update_display_board(location, player)
    @display.display_board
  end

  def update_board_grid(location, player)
    coord = translator[location]
    row = coord[0]
    col = coord[1]

    board.grid[row][col] = player.mark
    board.grid
  end

  def update_display_board(location, player)
    @display.display_array[location - 1] = player.mark
  end

  def setup_translator
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
    translator
  end

  def switch_turns
    @current_player != player1 ? @current_player = player1 : @current_player = player2
  end

  #run Rules.check_win
  def current_board_status
    if rules.check_winner
      # @current_player = @player2 #for @current_player.mark to update, need to call switch_turns; test for O win will fail otherwise
      "Winner is #{@current_player.mark}"
      # binding.pry
    elsif !rules.check_winner || !rules.tie
      "No winner or tie yet. Next.."
    end
  end


end
