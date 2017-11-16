describe Display do

  before(:each) do
    @display = Display.new
  end

   it "should display the board" do
    expect(@display.display_board).to eq(
    "\n
     _1_|_2_|_3_\n

     _4_|_5_|_6_\n

     _7_|_8_|_9_\n\n")
  end

end
