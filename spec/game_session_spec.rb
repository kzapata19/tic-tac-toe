describe GameSession do

  before(:each) do
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @board = Board.new(3)
    @rules = Rules.new(@board)
    @display1 = Display.new
    @current_player = @player2
    @game_session = GameSession.new(@player1, @player2, @display1)
  end

  it "should switch player turns" do
    @game_session.switch_turns

    expect(@game_session.current_player).to eq(@game_session.player1)
  end

  it "should display 'X' as winner of game" do
    @game_session.board.grid = [['X', 'O', 'X'], ['X', 'O', 'O'], ['X', 'X', 'O']]
    expect(@game_session.display_current_board_status).to eq("X is the winner!\n")

  end

  it "should display 'O' as winner of game" do
    @game_session.board.grid = [['X', 'O', 'X'], ['X', 'O', nil], ['O', 'O', 'X']]
    @current_player = @player2
    expect(@game_session.display_current_board_status).to eq("O is the winner!\n")
  end

  it "should display a tie message" do
    @game_session.board.grid = [['X', 'X', 'O'], ['O', 'O', 'X'], ['X', 'O', 'X']]
    expect(@game_session.display_current_board_status).to eq("No winner. Tie game!\n")
  end

end
