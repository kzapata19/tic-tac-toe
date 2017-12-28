describe Board do

  context "at the start of the game" do

    it "should have an empty grid" do
      @board = Board.new(3)
      expect(@board.grid).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end

  end

  it "should have a customizable size" do
    @board = Board.new(4)
    expect(@board.grid).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16])
  end

  it "should raise error if board size is less than 3" do
    expect {Board.new(2)}.to raise_error(Board::VoidBoardSizeError)
  end

  it "should have a grid size" do
    @board = Board.new(3)
    expect(@board.size).to eq(3)
  end

  it "should update the grid with player's mark" do
    @board = Board.new(3)
    expect(@board.update_grid(1, "X")).to eq(["X", 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it "should raise an error if player's move is outside grid size range" do
    @board = Board.new(4)
    expect {@board.update_grid(17, "X")}.to raise_error(Board::VoidMoveError)
  end

end
