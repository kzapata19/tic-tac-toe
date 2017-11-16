require 'pry'

describe GameSession do

  before(:each) do
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @board = Board.new(3)
    @rules = Rules.new(@board)
    @display = Display.new
    # @current_player = @player1
    @game_session = GameSession.new(@player1, @player2, @board, @rules, @display)
  end

  # it "should output welcome message at start of game" do
  #   expect(@game_session.start_game).to eq("Welcome to TicTacToe! Player 1 is 'X' and Player 2 is 'O'.")
  # end

  it "should ask Player 1 for their first move" do
    expect(@game_session.get_player_move(@player1)).to eq("\n
     _X_|_2_|_3_\n

     _4_|_5_|_6_\n

     _7_|_8_|_9_\n\n")
  end

  it "should mark the board's grid" do
    expect(@game_session.update_board_grid(1, @player1)).to eq([['X', nil, nil], [nil, nil, nil], [nil, nil, nil]])
  end
# TODO: test other edge cases like if player submits nil
  # it "should mark the board's grid" do
  #   expect(@game_session.update_board_grid(5, @player1)).to eq([[nil, nil, nil], [nil, 'X', nil], [nil, nil, nil]])
  # end

  it "should display current game status" do
    @game_session.get_player_move(@player1) #this will be necessary once location = 1 is removed from game_session

    expect(@game_session.current_board_status).to eq("No winner or tie yet. Next..")
  end

  it "should display 'X' as winner of game" do
    @game_session.board.grid = [['X', 'O', 'X'], ['X', 'O', 'O'], ['X', 'X', 'O']]
    expect(@game_session.current_board_status).to eq("Winner is X")

  end

  it "should display 'O' as winner of game" do
    @game_session.board.grid = [['X', 'O', 'X'], ['X', 'O', nil], ['O', 'O', 'X']]
    @current_player = @player2
    expect(@game_session.current_board_status).to eq("Winner is O")
  end

  it "should display a tie message" do
    @game_session.board.grid = [['X', 'X', 'O'], ['O', 'O', 'X'], ['X', 'O', 'X']]
    expect(@game_session.current_board_status).to eq("No winner. Tie game!")
  end

  it "should switch player turns" do
    @game_session.switch_turns

    expect(@game_session.current_player).to eq(@game_session.player2)
  end

  it "should ask for Player 2's move if no winner or tie" do
    @game_session.run_game_loop
    expect(@game_session.current_player).to eq(@game_session.player2)
  end


end
