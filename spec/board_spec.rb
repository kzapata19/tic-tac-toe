require 'pry'
# binding.pry

describe Board do

  context "at the start of the game" do

    it "should be empty" do

      board = Board.new(3,3).build_board
      # binding.pry
      expect(board).to eq([[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
    end

  end

  # it "should check for horizontal win" do
  #   board_structure = {1 => ["X", "X", "X"], 2 => [], 3 =>[]}
  #   current_board = Board.new(board_structure)
  #   expect(current_board.horizontal_win).to eq(true)
  # end

  # it "should check for a vertical win" do
  #   board_structure = {1 => ["X"], 2 => ["X"], 3 =>["X"]}
  #   current_board = Board.new(board_structure)
  #   expect(current_board.vertical_win).to eq(true)
  # end

end
