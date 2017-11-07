require "./board"

describe Board do

  board_structure = {1 => [], 2 => [], 3 =>[]}
  my_board = Board.new(board_structure)

  context "at the start of the game" do

    it "should be empty" do
      expect(my_board.board.length).to eq(3)
    end

  end

  it "should find target location on board" do
    expect(my_board.find_target_location(1, 0)).to eq(nil)
  end

  context "if target location is not occupied" do

    it "should insert symbol in target location" do
      expect(my_board.play("X", 1, 0)).to eq("successfully placed 'X'")
    end

  end

  context "if target location is occupied" do

    it "should ask for a new target location" do
      my_board.play("X", 1, 0)
      expect(my_board.play("O", 1, 0)).to eq("space occupied, provide a new location")
    end

  end

end

