describe Player do

  before(:each) do
    @input = StringIO.new
    @player1 = Player.new("X", @input)
  end

  it "provides board move" do
    @input.string = "1"
    expect(@player1.provide_move).to eq(1)
  end

end
