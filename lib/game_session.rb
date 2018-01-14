class GameSession

  attr_accessor :player1, :player2, :display1, :outcome, :board_size, :board, :current_player

  def initialize(player1, player2, display1, outcome, initializer)
    @player1 = player1
    @player2 = player2
    @display1 = display1
    @outcome = outcome
    @board = initializer.board
    @current_player = @player2

  end

  def start_game
    @display1.print_welcome
    @display1.print_game_board(@board.grid)
    run_game_loop
  end

private
  def run_game_loop
    switch_turns
    location = get_player_move
    update_board(location, @current_player.mark)
    display_current_board_status
  end

  def display_current_board_status
    full_board = @board.full_board?(@board.grid)

    if @outcome.winner?(@board.get_all_move_combos)
      @display1.print_winner(@current_player)
    elsif @outcome.is_tie?(@board.get_all_move_combos, full_board)
      @display1.print_tie
    else !@outcome.winner?(@board.get_all_move_combos) || !@outcome.is_tie?(@board.get_all_move_combos)
      @display1.print_interim_msg
      run_game_loop
    end
  end

  def switch_turns
    @current_player != player1 ? @current_player = player1 : @current_player = player2
  end

  def get_player_move
    @display1.print_current_player_turn(@current_player)
    @current_player.provide_move
  end

  def update_board(location, player_mark)
    @board.update_grid(location, player_mark)
    @display1.print_game_board(@board.grid)
  end

end
