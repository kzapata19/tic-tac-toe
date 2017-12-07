describe Rules do

  it "should check for a horizontal win" do
    scenario = [['X', 'X', 'X'],[nil, nil, nil],[nil, nil, nil]]
    board  = object_double(Board.new, :grid => scenario)
    current_game = Rules.new(board)
    expect(current_game.get_winning_mark).to eq('X')
  end

  it "should check for a vertical win" do
    scenario = [['X', nil, nil],['X', nil, nil],['X', nil, nil]]
    board  = object_double(Board.new, :grid => scenario)
    current_game = Rules.new(board)
    expect(current_game.get_winning_mark).to eq('X')
  end

  it "should check for a main diagonal win" do
    scenario = [['X', nil, nil],[nil, 'X', nil],[nil, nil, 'X']]
    board  = object_double(Board.new, :grid => scenario)
    current_game = Rules.new(board)
    expect(current_game.get_winning_mark).to eq('X')
  end

  it "should check for a antidiagonal win" do
    scenario = [[nil, nil, 'X'],[nil, 'X', nil],['X', nil, nil]]
    board  = object_double(Board.new, :grid => scenario)
    current_game = Rules.new(board)
    expect(current_game.get_winning_mark).to eq('X')
  end

  it "should check for a tie" do
    scenario = [['O', 'X', 'X'],['X', 'O', 'O'],['X', 'O', 'X']]
    board  = object_double(Board.new, :grid => scenario)
    current_game = Rules.new(board)
    expect(current_game.is_tie?).to eq(true)
  end

  it "should not result in tie if empty space available" do
    scenario = [['O', 'X', 'X'],['X', 'O', 'O'],['X', 'O', nil]]
    board  = object_double(Board.new, :grid => scenario)
    current_game = Rules.new(board)
    expect(current_game.is_tie?).to eq(false)
  end

end
