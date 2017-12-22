describe Player do

  before(:each) do
    @input = StringIO.new
    @player1 = Player.new("X", @input)
  end

  context "at the start of the game" do

    it "should provide a board size" do
      @input.string = "4"
      expect(@player1.provide_board_size).to eq(4)
    end

  end

  it "should have a mark" do
    expect(@player1.mark).to eq("X")
  end

# this will break because no size arg passed
  it "should provide a board move" do
    @input.string = "1"
    @board = Board.new
    expect(@player1.provide_move(@board.size)).to eq(1)
  end

  it "should raise an error if move is outside game board size" do
    @input.string = "17"
    @board = Board.new(4)
    expect {@player1.provide_move(@board.size)}.to raise_error(Player::VoidMoveError)
  end

end
