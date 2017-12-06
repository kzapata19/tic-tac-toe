describe Board do

  context "at the start of the game" do

    it "should be an empty grid" do

      board = Board.new(3)
      expect(board.create_grid).to eq([[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
    end

    it "should create a 3x3 grid by default" do
      board = Board.new
      expect(board.create_grid).to eq([[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
    end

  end

  it "should be able to customize it's grid size" do
    board = Board.new(4)
    expect(board.create_grid).to eq([[nil, nil, nil, nil], [nil, nil, nil, nil], [nil, nil, nil, nil], [nil, nil, nil, nil]])
  end

  it "should raise error if grid size is less than 2x2" do
    board = Board.new(1)
    # @board.create_grid
    expect(board).to raise_error(Board::InvalidBoardSizeError)
  end

  it "should have a grid size" do
    board = Board.new(4)
    expect(board.size).to eq(4)
  end

end
