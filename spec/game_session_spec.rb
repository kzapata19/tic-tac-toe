require 'pry'
describe GameSession do

  before(:each) do
    @player1 = Player.new(" X")
    @player2 = Player.new(" O")
    @display1 = Display.new
    @rules = Rules.new
    @game_session = GameSession.new(@player1, @player2, @display1, @rules)

    # @input = StringIO.new
    # @input.string = "3"
    # @output = StringIO.new
    # @game_session.start_game
  end

  it "should start the game" do

    expect(@game_session).to receive(:start_game)
    @game_session.start_game

  end

  it "should display a winning game result" do
    allow(@display1).to receive(:print_game_board).and_return("\n_'X_|_'O'_|_'X'_|\n\n_'X'_|_'O'_|_'O'_|\n\n_'X'_|_'X'_|_'O'_|\n\n")
    allow(@board).to receive(:grid).and_return(['X', 'O', 'X', 'X', 'O', 'O', 'X', 'X', 'O'])
    expect(@game_session.display_current_board_status).to eq("X is the winner!\n")

  end

  it "should display a tie game result" do
    @game_session.board.grid = ['X', 'X', 'O', 'O', 'O', 'X', 'X', 'O', 'X']

    expect(@game_session.start_game).to eq("No winner. Tie game!\n")
  end

end
