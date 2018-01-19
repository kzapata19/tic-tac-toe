describe Display do

  before(:each) do
    @board = Board.new(3)
    @input = StringIO.new
    @output = StringIO.new
    @display = Display.new(@input, @output)
  end

  context "at the start of the game" do

    it "should display a welcome message" do
    @display.print_welcome
    expect(@output.string).to eq("Welcome to TicTacToe! Player 1 is 'X' and Player 2 is 'O'.\n")
    end

    it "should ask for board size" do
      @display.get_board_size
      expect(@output.string).to eq("Please provide a number for the board size to build a proportional board: ")
    end

    it "should display an empty board of spaces labeled with prepended zeroes" do
      @display.print_game_board(@board.grid)
      expect(@output.string).to eq(
      "\n_01_|_02_|_03_|\n\n_04_|_05_|_06_|\n\n_07_|_08_|_09_|\n\n")
    end

  end

  context "when no win or tie" do

    it "should display an interim message" do
      @display.print_interim_msg
      expect(@output.string).to eq("No winner or tie yet...")
    end

  end

  it "should display current player's turn" do
    @current_player = Player.new(" X")
    @display.print_current_player_turn(@current_player)
    expect(@output.string).to eq("Player X's turn: ")
  end

  it "should display the winner's mark" do
    @winner = Player.new("X")
    @display.print_winner(@winner)
    expect(@output.string).to eq("X is the winner!\n")
  end

  it "should display a tie message" do
    @display.print_tie
    expect(@output.string).to eq("No winner. Tie game!\n")
  end

end
