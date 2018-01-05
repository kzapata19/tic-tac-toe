class GameSession

  attr_accessor :player1, :player2, :display1, :rules, :board_size, :board, :current_player

  def initialize(player1, player2, display1, rules)
    @player1 = player1
    @player2 = player2
    @display1 = display1
    @rules = rules
    @current_player = @player2
  end

  def start_game
    @display1.print_welcome
    @board_size = @display1.get_board_size
    @board = create_board
    @display1.print_game_board(@board.grid)
    run_game_loop
  end

private
  def create_board
    Board.new(@board_size)
  end

  def run_game_loop
    switch_turns
    location = get_player_move
    update_board(location, @current_player.mark)
    display_current_board_status
  end

  def display_current_board_status
    if @rules.winner?(@board.grid)
      @display1.print_winner(@current_player)
    elsif @rules.is_tie?(@board.grid)
      @display1.print_tie
    else !@rules.winner?(@board.grid) || !@rules.is_tie?(@board.grid)
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
