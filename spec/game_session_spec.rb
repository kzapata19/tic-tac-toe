describe GameSession do

  before(:each) do
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @board = Board.new(3, 3)
    @rules = Rules.new(@board)
    @display = Display.new(@board)
    # @current_player = @player1
    @game_session = GameSession.new(@player1, @player2, @board, @rules, @display)
  end

  # it "should output welcome message at start of game" do
  #   expect(@game_session.start_game).to eq("Welcome to TicTacToe! Player 1 is 'X' and Player 2 is 'O'.")
  # end

  it "should ask Player 1 for their first move" do
    expect(@game_session.provide_move(@player1)).to eq("
     _X_|_2_|_3_\n
        |   |
     _4_|_5_|_6_\n
        |   |
     _7_|_8_|_9_\n")
  end

  it "should mark the board's grid" do
    expect(@game_session.update_board_grid(1, @player1)).to eq([['X', nil, nil], [nil, nil, nil], [nil, nil, nil]])
  end

  it "should mark the board's grid" do
    expect(@game_session.update_board_grid(5, @player1)).to eq([[nil, nil, nil], [nil, 'X', nil], [nil, nil, nil]])
  end

  it "should display current game status" do
    @game_session.provide_move(@player1)

    expect(@game_session.current_board_status).to eq("No winner or tie yet. Next..")
  end

  it "should switch player turns" do
    @game_session.switch_turns

    expect(@game_session.current_player).to eq(@game_session.player2)
  end

  # it "should ask for Player 1's first move" do

  # end

end
