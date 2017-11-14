# Chapter 6 in Beginnig Ruby
# look up let

describe Player do
  before(:each) do
    @board = Board.new(3, 3)
    @player1 = Player.new("X")
    @player2 = Player.new("O")
  end

  it "should mark the board" do
    new_board = @player1.mark_board(0, 0, @board)
    expect(new_board.get_mark(0, 0)).to eq("X")
  end

end
