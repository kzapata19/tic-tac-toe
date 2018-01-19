describe Board do
  before(:each) do
    @board = Board.new(3)
  end

  context "at the start of the game" do

    it "should have an empty grid" do
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
    expect(@board.size).to eq(3)
  end

  it "should update the grid with player's mark" do
    expect(@board.update_grid(1, "X")).to eq(["X", 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it "should raise an error if player's move is outside grid size range" do
    @board = Board.new(4)
    expect {@board.update_grid(17, "X")}.to raise_error(Board::VoidMoveError)
  end

  it "should place each row's content in an array" do
    expect(@board.get_all_rows).to eq([
      [1,2,3],
      [4,5,6],
      [7,8,9]
    ])
  end

  it "should place each column's content in an array" do
    expect(@board.get_all_columns).to eq([
      [1,4,7],
      [2,5,8],
      [3,6,9]
    ])
  end

  it "should place the antidiagonal's content in an array" do
    expect(@board.get_antidiagonal).to eq([3,5,7])
  end

  it "should place the main diagonal's content in an array" do
    expect(@board.get_main_diagonal).to eq([1,5,9])
  end

  it "should place both diagonals in an array" do
    expect(@board.get_diagonals).to eq([[1,5,9], [3,5,7]])
  end

  it "should get all possible move combinations for a 3x3 board" do
    expect(@board.get_all_move_combos).to eq([
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [3, 5, 7]
    ])
  end

  it "should get all possible move combinations for a 4x4 board" do
    @board = Board.new(4)
    expect(@board.get_all_move_combos).to eq([
      [1, 2, 3, 4],
      [5, 6, 7, 8],
      [9, 10, 11, 12],
      [13, 14, 15, 16],
      [1, 5, 9, 13],
      [2, 6, 10, 14],
      [3, 7, 11, 15],
      [4, 8, 12, 16],
      [1, 6, 11, 16],
      [4, 7, 10, 13]
    ])
  end

  it "should return false when board is empty" do
    expect(@board.full_board?(@board.grid)).to be_falsey
  end

  it "should return true if board is full" do
    @board.grid = ['X', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'X']
    expect(@board.full_board?(@board.grid)).to be_truthy
  end

end
