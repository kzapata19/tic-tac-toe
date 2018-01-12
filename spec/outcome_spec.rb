describe Outcome do

  it "should check for a horizontal win" do
    current_game = Outcome.new
    scenario = ['X', 'X', 'X']

    expect(current_game.winner?(scenario)).to eq(false)
  end

  it "should check for all types of vertical wins" do
    current_game = Outcome.new
    left_col_win = [["X", "X", "O"], ["X", "O", "O"], ["X", "O", "X"], ["X", "X", "X"], ["X", "O", "O"], ["O", "O", "X"], ["X", "O", "X"], ["O", "O", "X"]]
    mid_col_win = [["X", "O", "X"], ["04", "O", "06"], ["07", "O", "X"], ["X", "04", "07"], ["O", "O", "O"], ["X", "06", "X"], ["X", "O", "X"], ["X", "O", "07"]]
    right_col_win = [["X", "O", "X"], ["O", "O", "X"], ["07", "08", "X"], ["X", "O", "07"], ["O", "O", "08"], ["X", "X", "X"], ["X", "O", "X"], ["X", "O", "07"]]

    expect(current_game.winner?(left_col_win)).to be_truthy
    expect(current_game.winner?(mid_col_win)).to be_truthy
    expect(current_game.winner?(right_col_win)).to be_truthy
  end

  it "should check for a main diagonal win" do
    current_game = Outcome.new
    main_diagonal_win= [["X", "02", "03"], ["04", "X", "06"], ["07", "08", "X"], ["X", "04", "07"], ["02", "X", "08"], ["03", "06", "X"], ["X", "X", "X"], ["03", "X", "07"]]

    expect(current_game.winner?(main_diagonal_win)).to be_truthy
  end

  it "should check for an antidiagonal win" do
    current_game = Outcome.new
    anti_diagonal_win = [["01", "02", "X"], ["04", "X", "06"], ["X", "08", "09"], ["01", "04", "X"], ["02", "X", "08"], ["X", "06", "09"], ["01", "X", "09"], ["X", "X", "X"]]

    expect(current_game.winner?(anti_diagonal_win)).to be_truthy
  end

  it "should return false when no winner" do
    current_game = Outcome.new
    tie_scenario = [["O", "X", "X"], ["X", "O", "O"], ["X", "O", "X"], ["O", "X", "X"], ["X", "O", "O"], ["X", "O", "X"], ["O", "O", "X"], ["X", "O", "X"]]

    expect(current_game.winner?(tie_scenario)).to be_falsy
  end

  it "should return true for a tie game" do
    current_game = Outcome.new
    tie_scenario = [["O", "X", "X"], ["X", "O", "O"], ["X", "O", "X"], ["O", "X", "X"], ["X", "O", "O"], ["X", "O", "X"], ["O", "O", "X"], ["X", "O", "X"]]

    expect(current_game.is_tie?(tie_scenario)).to be_truthy
  end

  context "when a board space is empty" do
    it "should not result in a tie" do
      current_game = Outcome.new
      scenario = ['O', 'X', 'X', 'X', 'O', 'O','X', 'O', '09']

      expect(current_game.is_tie?(scenario)).to eq(false)
    end
  end

end
