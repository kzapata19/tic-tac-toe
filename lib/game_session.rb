class GameSession

  attr_accessor :player1, :player2, :display1, :translator, :current_player, :board_size, :board, :rules

  def initialize(player1, player2, display1)
    @player1 = player1
    @player2 = player2
    @display1 = display1
    @board_size = get_board_size
    @board = Board.new(@board_size)
    @rules = Rules.new(@board)
    @translator = setup_translator
    @current_player = @player2
  end

  def start_game
    display1.print_welcome
    display1.display_message(@board.game_board)
    run_game_loop
  end

  def run_game_loop
    switch_turns
    location = get_player_move
    update_both_boards(location, @current_player)
    display1.display_message(@board.game_board)
    display_current_board_status
  end

  def get_board_size
    display1.get_board_size
  end

  def display_current_board_status
    if @rules.get_winning_mark
      @display1.print_winner(@current_player)
    elsif @rules.is_tie?
      @display1.print_tie
    else !@rules.get_winning_mark || !@rules.is_tie?
      @display1.print_interim_msg
      run_game_loop
    end
  end

  def switch_turns
    @current_player != player1 ? @current_player = player1 : @current_player = player2
  end

  def get_player_move
    @display1.print_current_player_turn(@current_player)
    @current_player.provide_move(@board.board_numbers.size)
  end

  def update_both_boards(location, player)
    update_board_grid(location, player)
    update_display_board(location, player)
  end

  def update_board_grid(location, player)
    coord = @translator[location]
    row = coord[0]
    col = coord[1]

    @board.grid[row][col] = player.mark
    @board.grid
  end

#reason why display board is not updating with grid state:
  def update_display_board(location, player)
    updated_board = ""
    location_str = location.to_s
    @board.game_board.each_char do |char, index|
      if char == location_str
        updated_board = updated_board + player.mark
      else
        updated_board = updated_board + char
      end
    end
    @board.game_board = updated_board

  end

  def setup_translator
    translator = {}
    key = 1
    column_length = (1..@board.size).to_a
    row_length = (1..@board.size).to_a

    row_length.each do |row|
      column_length.each do |col|
        translator[key] = [(row - 1), (col - 1)]
        key = key + 1
      end
    end
    translator
  end

end
