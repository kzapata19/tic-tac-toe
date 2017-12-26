describe Board do

  context "at the start of the game" do

    it "should have an empty grid" do
      @board = Board.new(3)
      expect(@board.grid).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end

    it "should create a 3x3 grid by default" do
      @board = Board.new
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
    @board = Board.new(4)
    expect(@board.size).to eq(4)
  end

  it "should update the grid with player's mark" do
    @board = Board.new(3)
    expect(@board.update_grid(1, "X")).to eq(["X", 2, 3, 4, 5, 6, 7, 8, 9])
  end

# this might have to go to Display not Board
  # it "should create the game board" do
  #   @board = Board.new(4)
  #   expect(@board.game_board).to eq("\n_01_|_02_|_03_|_04_|\n\n_05_|_06_|_07_|_08_|\n\n_09_|_10_|_11_|_12_|\n\n_13_|_14_|_15_|_16_|\n\n")
  # end

end
