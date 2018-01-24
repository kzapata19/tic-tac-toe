describe Initializer do

  it "creates a Board with same size as the user's input" do
    @input = StringIO.new
    @output = StringIO.new
    @input.string = "4"
    @display = Display.new(@input, @output)
    @board = Initializer.new(@display).board

    expect(@board.size).to eq(4)
  end

  # it "raises error if board size is less than 3" do
  #   @input = StringIO.new
  #   @output = StringIO.new
  #   @input.string = "2"
  #   @display = Display.new(@input, @output)

  #   expect { Initializer.new(@display) }.to raise_error("Board size is invalid. Size must be a positive integer greater than 2. Try again...")
  # end
end
