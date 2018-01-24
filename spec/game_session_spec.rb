describe GameSession do

  before(:all) do
    @input = StringIO.new
    @output = StringIO.new
    @input.string = "3"
    @player1 = Player.new(" X")
    @player2 = Player.new(" O")
    @display = Display.new(@input, @output)
    @outcome = Outcome.new
    @initializer = Initializer.new(@display)
    @game_session = GameSession.new(@player1, @player2, @display, @outcome, @initializer.board)
  end

  # it "starts the game" do
  #   @game_session.start_game
  #   expect(@game_session).to receive(:start_game)
  # end

  it "displays a winning game result" do
    allow(@display).to receive(:print_game_board).and_return("\n_'X_|_'O'_|_'X'_|\n\n_'X'_|_'O'_|_'O'_|\n\n_'X'_|_'X'_|_'O'_|\n\n")
    allow(@initializer.board).to receive(:grid).and_return(['X', 'O', 'X', 'X', 'O', 'O', 'X', 'X', 'O'])
    expect(@game_session.display_current_board_status).to eq("X is the winner!\n")
  end

  # it "displays a tie game result" do
  #   @initializer.board.grid = ['X', 'X', 'O', 'O', 'O', 'X', 'X', 'O', 'X']
  #   expect(@game_session.start_game).to eq("No winner. Tie game!\n")
  # end

  # it "raises an error if player's move is outside grid size range" do
  #   @board = Board.new(3)
  #   @input.string = "17"
  #   expect {@game_session.get_player_move}.to raise_error(GameSession::VoidMoveError)
  # end

end
