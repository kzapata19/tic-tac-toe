describe Rules do

  it "should check for a horizontal win" do

    scenario = ['X', 'X', 'X', '04', '05', '06', '07', '08', '09']
    current_game = Rules.new
    expect(current_game.get_horizontal_win(scenario)).to eq(['X', 'X', 'X'])
  end

  it "should check for a vertical win" do
    scenario = ['X', '02', '03', 'X', '05', '06', 'X', '08', '09']
    current_game = Rules.new
    expect(current_game.get_vertical_win(scenario)).to eq(['X', 'X', 'X'])
  end

  it "should check for a main diagonal win" do
    scenario = ['X', '02', '03', '04', 'X', '06', '07', '08', 'X']
    current_game = Rules.new
    expect(current_game.get_main_diagonal_win(scenario)).to eq(['X', 'X', 'X'])
  end

### TESTS BELOW MUST BE UPDATED FOR SINGLE ARRAY GRID

  # it "should check for a antidiagonal win" do
  #   scenario = ['01', '02', 'X', '04', 'X', '06', 'X', '08', '09']
  #   current_game = Rules.new
  #   expect(current_game.get_winning_mark).to eq('X')
  # end

  # it "should check for a tie" do
  #   scenario = ['O', 'X', 'X', 'X', 'O', 'O', 'X', 'O', 'X']
  #   current_game = Rules.new
  #   expect(current_game.is_tie?).to eq(true)
  # end

  # it "should not result in tie if empty space available" do
  #   scenario = ['O', 'X', 'X', 'X', 'O', 'O','X', 'O', '09']
  #   current_game = Rules.new
  #   expect(current_game.is_tie?).to eq(false)
  # end

end
