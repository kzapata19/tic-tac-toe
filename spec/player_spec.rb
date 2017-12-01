describe Player do

  before(:each) do
    @input = StringIO.new
    @player1 = Player.new("X", @input)
  end

  it "should have a mark" do
    expect(@player1.mark).to eq("X")
  end

  it "provides a board move" do
    @input.string = "1"
    expect(@player1.provide_move).to eq(1)
  end

end
