require "./player"
require_relative "board_spec"

describe Player do

  board_structure = {1 => [], 2 => [], 3 =>[]}
  my_board = Board.new(board_structure)

  player_1 = Player.new(my_board.board, "X")

  it "should have a board" do
    expect(player_1.board).to eq(board_structure)
  end

  context "if location is empty" do

    it "should place mark on target location" do
      expect(player_1.mark_board(1, 0)).to eq("successfully marked board")
    end

  end

  context "if location is occupied" do

    it "should ask for a new location" do

      player_1.mark_board(1, 0)

      expect(player_1.mark_board(1, 0)).to eq("space occupied, find a new location")
    end

  end

end
