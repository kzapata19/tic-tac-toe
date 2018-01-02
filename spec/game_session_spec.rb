describe GameSession do

  before(:each) do
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @display1 = double("display1")

    @board = double("board")

    @game_session = GameSession.new(@player1, @player2, @display1)
  end

  it "should switch player turns" do
    @game_session.switch_turns
    expect(@game_session.current_player).to eq(@game_session.player1)
  end

  it "should display a winning game result" do
    allow(@display1).to receive(:print_game_board).and_return("\n_'X_|_'O'_|_'X'_|\n\n_'X'_|_'O'_|_'O'_|\n\n_'X'_|_'X'_|_'O'_|\n\n")
    allow(@board).to receive(:grid).and_return(['X', 'O', 'X', 'X', 'O', 'O', 'X', 'X', 'O'])
    expect(@game_session.display_current_board_status).to eq("X is the winner!\n")

  end

  it "should display a tie game result" do
    @game_session.board.grid = ['X', 'X', 'O', 'O', 'O', 'X', 'X', 'O', 'X']
    expect(@game_session.display_current_board_status).to eq("No winner. Tie game!\n")
  end

end
