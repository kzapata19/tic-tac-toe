describe Display do

  before(:each) do
    @board = Board.new(3, 3)
    @display = Display.new(@board)
  end

   it "should display the board" do
    expect(@display.display_board).to eq([[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
  end

end