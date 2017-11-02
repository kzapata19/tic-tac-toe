require "./board"

describe "tic-tac-toe" do
  context "at start of the game" do
    it "should print an empty board" do
      empty_board = "___"
      expect(create_board()).to eq(empty_board)
    end
  end
end
