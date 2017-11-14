describe GameSession do

  before(:each) do
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @board = Board.new(3, 3)
    @rules = Rules.new(@board)
    @display = Display.new(@board)
    @game_session = GameSession.new(@player1, @player2, @board, @rules, @display)
  end

  it "should output welcome message at start of game" do
    expect(@game_session.start_game).to eq("Welcome to TicTacToe! Player 1 is 'X' and Player 2 is 'O'.")
  end

  it "should ask Player 1 for their first move" do
    expect(@game_session.provide_move(1, @player1)).to eq("
     _X_|_2_|_3_\n
        |   |
     _4_|_5_|_6_\n
        |   |
     _7_|_8_|_9_\n")
  end

  # it "should ask for Player 1's first move" do

  # end

end