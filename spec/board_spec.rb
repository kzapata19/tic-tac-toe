require "./board"
# require_relative "./player"

describe Board do

  board_structure = {1 => [], 2 => [], 3 =>[]}
  my_board = Board.new(board_structure)

  context "at the start of the game" do

    it "should be empty" do
      expect(my_board.board.length).to eq(3)
    end

  end

# should I test find_target_location if its a helper method for play? Prob not?
  it "should find target location on board" do
    expect(my_board.find_target_location(1, 0)).to eq(nil)
  end

# definitely test play since method will be publicly available
  context "if target location is not occupied" do

    it "should insert symbol in target location" do
      expect(my_board.mark_board("X", 1, 0)).to eq("successfully placed 'X'")
    end

  end

  context "if target location is occupied" do

    it "should ask for a new target location" do
      my_board.mark_board("X", 1, 0)
      expect(my_board.mark_board("O", 1, 0)).to eq("space occupied, provide a new location")
    end

  end

end

