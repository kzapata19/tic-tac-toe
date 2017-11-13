require "./board"
# require_relative "./player"

describe Board do

  board_structure = {1 => [], 2 => [], 3 =>[]}
  board_1 = Board.new(board_structure)
  board = board_1.board

  context "at the start of the game" do

    it "board should be empty" do
      length = 0
      board.each_value {|row| length = row.length + length}

      expect(length).to eq(0)
    end

  end

end
