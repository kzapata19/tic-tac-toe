require "./board"

describe Board do

  context "at start of the game" do

    it "should print an empty board" do

      empty_board = {a: [], b: [], c: []}

      expect(Board.new.create_board).to eq(empty_board)
    end

  end

end

=begin

  1. Create board structure: only adding marks to the board, not able to remove mark once on the board

    Possible options:

    A. Nested array
      [
        ["X", "X", "O"],
        ["O", "X", "O"],
        ["X", "O", "O"]
      ]

    B. Hash with array values (row location will be associated with specific label a/b/c or change top/middle/bottom?)
    NOTE: Ruby 1.9, can rely on Hash order
      {
        a: ["X", "X", "O"],
        b: ["O", "X", "O"],
        c: ["X", "O", "O"]
      }

    C. Hash with string values
      {
        a: "X,X,O",
        b: "O,X,O",
        c: "X,O,O"
      }

    D. Array of stringified rows
      ["X,X,O", "O,X,O", "X,O,O"]

    E. Long string
      "X,X,O,O,X,O,X,O,O"

    F. Three strings
      "X,X,O\n",
      "O,X,O\n",
      "X,O,O"

  2. Player actions:

    A. Choose a mark "X" or "O"
    B. Place mark on target location

  3. Mark the board:

    A. Ask player for type of mark ("X" or "O") and target location
      1. Target location two params: "a"/"b"/"c" (row) AND 0/1/2 (column)

    B. Verify that target location is not occupied

    C. If not occupied, place mark on target location

    D. Print updated board after each move?

  4. Check for winner (three of same marks in a row)

    A. Horizontal
    B. Vertical
    C. Diagonal (top left to bottom right)
    D. Diagonal (top right to bottom left)

  5. Check for draw
    A. No winner
    B. Full board

  6. Announce outcome

    A. Winner
    B. Draw

=end