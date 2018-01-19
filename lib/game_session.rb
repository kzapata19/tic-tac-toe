class GameSession

  class VoidMoveError < StandardError
    def initialize(message)
      super(message)
    end
  end

  attr_accessor :player1, :player2, :display, :outcome, :board_size, :board, :current_player

  def initialize(player1, player2, display, outcome, initializer)
    @player1 = player1
    @player2 = player2
    @display = display
    @outcome = outcome
    @board = initializer.board
    @current_player = @player2

  end

  def start_game
    @display.print_welcome
    @display.print_game_board(@board.grid)
    run_game_loop
  end

private
  def run_game_loop
    switch_turns
    begin
      location = get_player_move
      if !valid_move?(location)
        raise VoidMoveError.new("'#{location}' is out of range. Provide a number between 1 and #{@board.grid.size} inclusive. Try again...")
      end
    rescue VoidMoveError=>e
       @display.display_message("#{e.message}\n")
      retry
    end
    update_board(location, @current_player.mark)
    display_current_board_status
  end

  def valid_move?(location)
    location > 0 && location <= @board.grid.size
  end

  def display_current_board_status
    full_board = @board.full_board?(@board.grid)

    if @outcome.has_winner?(@board.get_all_move_combos)
      @display.print_winner(@current_player)
    elsif @outcome.is_tie?(@board.get_all_move_combos, full_board)
      @display.print_tie
    else
      @display.print_interim_msg
      run_game_loop
    end
  end

  def switch_turns
    @current_player = (@current_player == player2) ? player1 : player2
  end

  def get_player_move
    @display.print_current_player_turn(@current_player)
    @current_player.provide_move
  end

  def update_board(location, player_mark)
    @board.update_grid(location, player_mark)
    @display.print_game_board(@board.grid)
  end

end
