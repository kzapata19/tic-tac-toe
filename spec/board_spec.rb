require 'pry'

describe Board do

  context "at the start of the game" do

    it "should be empty" do

      board = Board.new(3,3)
      expect(board.grid).to eq([[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
    end

  end

end
