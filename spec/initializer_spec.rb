describe Initializer do

  it "should initialize Board class from user-provided board size input" do
    @input = StringIO.new
    @output = StringIO.new
    @input.string = "3"
    @output.string = "Please provide a number for the board size to build a proportional board: "
    @initializer = Initializer.new(@input, @output)

    expect(@initializer.board).to be_an_instance_of(Board)
  end

end
