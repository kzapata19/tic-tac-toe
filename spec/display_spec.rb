describe Display do

  before(:each) do
    @board = Board.new(3, 3)
    @display = Display.new(@board)
  end

   it "should display the board" do
    expect(@display.display_board).to eq(
    "
     _1_|_2_|_3_\n
        |   |
     _4_|_5_|_6_\n
        |   |
     _7_|_8_|_9_\n")
  end



end