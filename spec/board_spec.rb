describe Board do

  context "at the start of the game" do

    it "grid should be empty" do

      @board = Board.new(3)
      expect(@board.grid).to eq([[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
    end

    it "should create a 3x3 grid by default" do
      @board = Board.new
      expect(@board.grid).to eq([[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
    end

  end

  #REACH
  # it "should create a grid larger than 1x1" do
  #   @board = Board.new(1)
  #   expect(@board.valid_size?).to eq("Enter a board size larger than 1")
  # end

end


