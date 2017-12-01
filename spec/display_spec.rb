describe Display do

  before(:each) do
    @board = Board.new
    @output = StringIO.new
    @display1 = Display.new(@board, @output)
  end

  context "at the start of the game" do
    it "should display an empty board" do
      @display1.display_board
      expect(@output.string).to eq(
      "\n_1_|_2_|_3_\n\n_4_|_5_|_6_\n\n_7_|_8_|_9_\n\n")
    end
  end

  it "should display given message" do
    @display1.display_message("Welcome to TicTacToe!")
    expect(@output.string).to eq("Welcome to TicTacToe!")
  end

end
