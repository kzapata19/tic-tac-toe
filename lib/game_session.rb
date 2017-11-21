# this class will orchestrate interactions between all classes
class GameSession

  attr_accessor :player1, :player2, :board, :rules, :display, :translator, :current_player

  def initialize(player1, player2, board, rules, display)
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @board = Board.new(3)
    @rules = Rules.new(@board)
    @display = Display.new
    @translator = setup_translator
    @current_player = @player2
    self.start_game
  end

  def start_game
    @display.display_message("Welcome to TicTacToe! Player 1 is 'X' and Player 2 is 'O'.")
    @display.display_board
    run_game_loop #comment out for tests
  end

  def run_game_loop
    switch_turns
    location = get_player_move
    update_both_boards(location, @current_player)
    @display.display_board
    display_current_board_status


  end

  def display_current_board_status
    if rules.get_winning_mark
      @display.display_message("#{@current_player.mark} is the winner!\n")
    elsif rules.is_tie
      @display.display_message("No winner. Tie game!\n")
    else !rules.get_winning_mark || !rules.is_tie
      @display.display_message("No winner or tie yet...")
      # switch_turns
      run_game_loop
    end
  end

  def switch_turns
    @current_player != player1 ? @current_player = player1 : @current_player = player2
  end

  def get_player_move
    @display.display_message("Player #{@current_player.mark}'s turn: ")
    # location = 1 # this is harcoded for tests only
    @current_player.provide_move
  end

  def update_both_boards(location, player)
    update_board_grid(location, player)
    update_display_board(location, player)
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

end
