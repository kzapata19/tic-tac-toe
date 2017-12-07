describe Display do

  before(:each) do
    @board = Board.new
    @input = StringIO.new
    @output = StringIO.new
    @display1 = Display.new(@input, @output)
  end

  context "at the start of the game" do

    it "should display a welcome message" do
    @display1.print_welcome
    expect(@output.string).to eq("Welcome to TicTacToe! Player 1 is 'X' and Player 2 is 'O'.")
    end

    it "should ask for board size" do
      @display1.get_board_size
      expect(@output.string).to eq("Please provide a number for the board size to build a proportional board: ")
    end

    it "should display an empty board" do
      @display1.display_message(@board.game_board)
      expect(@output.string).to eq(
      "\n_1_|_2_|_3_|\n\n_4_|_5_|_6_|\n\n_7_|_8_|_9_|\n\n")
    end

  end

  context "when no win or tie" do

    it "should display an interim message" do
      @display1.print_interim_msg
      expect(@output.string).to eq("No winner or tie yet...")
    end

  end

  it "should display current player's turn" do
    @current_player = Player.new("X")
    @display1.print_current_player_turn(@current_player)
    expect(@output.string).to eq("Player X's turn: ")
  end

  it "should display the winner's mark" do
    @winner = Player.new("X")
    @display1.print_winner(@winner)
    expect(@output.string).to eq("X is the winner!\n")
  end

  it "should display a tie message" do
    @display1.print_tie
    expect(@output.string).to eq("No winner. Tie game!\n")
  end

end
