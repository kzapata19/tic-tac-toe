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

  it "should provide a board move" do
    @input.string = "1"
    expect(@player1.provide_move).to eq(1)
  end

end
