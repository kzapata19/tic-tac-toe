describe Rules do

  it "should check for a horizontal win" do
    current_game = Rules.new
    scenario = ['X', 'X', 'X', '04', '05', '06', '07', '08', '09']

    expect(current_game.get_horizontal_win(scenario)).to eq(['X', 'X', 'X'])
  end

  it "should check for a vertical win" do
    current_game = Rules.new
    left_col = ['X', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'X']
    mid_col = ['X', 'O', 'X', '04', 'O', '06', '07', 'O', 'X']
    right_col = ['X', 'O', 'X', 'O', 'O', 'X', '07', '08', 'X']

    expect(current_game.get_vertical_win(left_col)).to eq(['X', 'X', 'X'])
    expect(current_game.get_vertical_win(mid_col)).to eq(['O', 'O', 'O'])
    expect(current_game.get_vertical_win(right_col)).to eq(['X', 'X', 'X'])
  end

  it "should check for a main diagonal win" do
    current_game = Rules.new
    scenario = ['X', '02', '03', '04', '05', 'X', '07', '08', '09', '10', 'X', '12', '13', '14', '15', 'X']

    expect(current_game.get_main_diagonal_win(scenario)).to eq(['X', 'X', 'X', 'X'])
  end

  it "should check for an antidiagonal win" do
    current_game = Rules.new
    scenario = ['01', '02', 'X', '04', 'X', '06', 'X', '08', '09']

    expect(current_game.get_antidiagonal_win(scenario)).to eq(['X', 'X', 'X'])
  end

  it "should check for both types of diagonal wins" do
    current_game = Rules.new
    main_diagonal = ['X', '02', '03', '04', '05', 'X', '07', '08', '09', '10', 'X', '12', '13', '14', '15', 'X']
    anti_diagonal = ['01', '02', '03', 'X', '05', '06', 'X', '08', '09', 'X', '11', '12', 'X', '14', '15', '16']

    expect(current_game.get_diagonal_win(main_diagonal)).to eq(['X', 'X', 'X', 'X'])
    expect(current_game.get_diagonal_win(anti_diagonal)).to eq(['X', 'X', 'X', 'X'])

  end
  it "should check for a winner" do
    current_game = Rules.new
    vert_win_scenario = ['X', 'X', 'O', 'X', 'O', 'O', 'X', 'O', 'X']
    losing_scenario = ['O', 'X', 'X', 'X', 'O', 'O', 'X', 'O', 'X']

    expect(current_game.winner?(vert_win_scenario)).to eq(true)
    expect(current_game.winner?(losing_scenario)).to eq(false)
  end

  it "should check for a tie" do
    scenario = ['O', 'X', 'X', 'X', 'O', 'O', 'X', 'O', 'X']
    current_game = Rules.new
    expect(current_game.is_tie?(scenario)).to eq(true)
  end

  context "when a board space is empty" do
    it "should not result in a tie" do
      scenario = ['O', 'X', 'X', 'X', 'O', 'O','X', 'O', '09']
      current_game = Rules.new
      expect(current_game.is_tie?(scenario)).to eq(false)
    end
  end

end
