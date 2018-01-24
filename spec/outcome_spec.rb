describe Outcome do
  before(:all) do
    @current_game = Outcome.new
  end

  it "returns true for all types of horizontal wins" do
    top_horizontal_win = [
      ["X",  "O",  "03"],
      ["04", "O",  "O"],
      ["X",  "X",  "X"],
      ["X",  "04", "X"],
      ["O",  "O",  "X"],
      ["03", "O",  "X"],
      ["X",  "O",  "X"],
      ["03", "O", "X"]
    ]
    mid_horizontal_win = [
      ["X",  "02", "03"],
      ["O",  "O",  "O"],
      ["X",  "X",  "09"],
      ["X",  "O",  "X"],
      ["02", "O",  "X"],
      ["03", "O",  "09"],
      ["X",  "O",  "09"],
      ["03", "O",  "X"]
    ]
    bottom_horizontal_win = [
      ["01", "O",  "X"],
      ["O",  "O",  "06"],
      ["X",  "X",  "X"],
      ["01", "O",  "X"],
      ["O",  "O",  "X"],
      ["X",  "06", "X"],
      ["01", "O",  "X"],
      ["X",  "O",  "X"]
    ]
    expect(@current_game.has_winner?(top_horizontal_win)).to be_truthy
    expect(@current_game.has_winner?(mid_horizontal_win)).to be_truthy
    expect(@current_game.has_winner?(bottom_horizontal_win)).to be_truthy
  end

  it "returns true for all types of vertical wins" do
    left_col_win = [
      ["X", "X", "O"],
      ["X", "O", "O"],
      ["X", "O", "X"],
      ["X", "X", "X"],
      ["X", "O", "O"],
      ["O", "O", "X"],
      ["X", "O", "X"],
      ["O", "O", "X"]
    ]
    mid_col_win = [
      ["X",  "O",  "X"],
      ["04", "O",  "06"],
      ["07", "O",  "X"],
      ["X",  "04", "07"],
      ["O",  "O",  "O"],
      ["X",  "06", "X"],
      ["X",  "O",  "X"],
      ["X",  "O",  "07"]
    ]
    right_col_win = [
      ["X",  "O",  "X"],
      ["O",  "O",  "X"],
      ["07", "08", "X"],
      ["X",  "O",  "07"],
      ["O",  "O",  "08"],
      ["X",  "X",  "X"],
      ["X",  "O",  "X"],
      ["X",  "O",  "07"]
    ]
    expect(@current_game.has_winner?(left_col_win)).to be_truthy
    expect(@current_game.has_winner?(mid_col_win)).to be_truthy
    expect(@current_game.has_winner?(right_col_win)).to be_truthy
  end

  it "returns true for a main diagonal win" do
    main_diagonal_win= [
      ["X",  "02", "03"],
      ["04", "X",  "06"],
      ["07", "08", "X"],
      ["X",  "04", "07"],
      ["02", "X",  "08"],
      ["03", "06", "X"],
      ["X",  "X",  "X"],
      ["03", "X",  "07"]
    ]
    expect(@current_game.has_winner?(main_diagonal_win)).to be_truthy
  end

  it "returns true for an antidiagonal win" do
    anti_diagonal_win = [
      ["01", "02", "X"],
      ["04", "X",  "06"],
      ["X",  "08", "09"],
      ["01", "04", "X"],
      ["02", "X",  "08"],
      ["X",  "06", "09"],
      ["01", "X",  "09"],
      ["X",  "X",  "X"]
    ]
    expect(@current_game.has_winner?(anti_diagonal_win)).to be_truthy
  end

  it "returns false when no winner" do
    tie_scenario = [
      ["O", "X", "X"],
      ["X", "O", "O"],
      ["X", "O", "X"],
      ["O", "X", "X"],
      ["X", "O", "O"],
      ["X", "O", "X"],
      ["O", "O", "X"],
      ["X", "O", "X"]
    ]
    expect(@current_game.has_winner?(tie_scenario)).to be_falsy
  end

  it "returns true for a tie game" do
    tie_scenario = [
      ["O", "X", "X"],
      ["X", "O", "O"],
      ["X", "O", "X"],
      ["O", "X", "X"],
      ["X", "O", "O"],
      ["X", "O", "X"],
      ["O", "O", "X"],
      ["X", "O", "X"]
    ]
    full_board = true
    expect(@current_game.tie?(tie_scenario, full_board )).to be_truthy
  end

  context "when a board space is empty" do
    it "does not result in a tie" do
      scenario = [
        ["O", "X", "X"],
        ["X", "O", "O"],
        ["X", "O", "09"],
        ["O", "X", "X"],
        ["X", "O", "O"],
        ["X", "O", "09"],
        ["O", "O", "09"],
        ["X", "O", "X"]
      ]
      full_board = false
      expect(@current_game.tie?(scenario, full_board)).to be_falsy
    end
  end

end
