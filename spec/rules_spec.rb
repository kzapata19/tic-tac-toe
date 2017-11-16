describe Rules do

  before(:each) do
    @board = Board.new(3)
    @current_game =  Rules.new(@board)
  end

  it "should check for a horizontal win" do
    @board.grid = [['X', 'X', 'X'],
                   [nil, nil, nil],
                   [nil, nil, nil]]
    expect(@current_game.get_horizontal_winning_mark).to eq('X')
  end

  it "should check for a vertical win" do
    @board.grid = [['X', nil, nil],
                   ['X', nil, nil],
                   ['X', nil, nil]]
    expect(@current_game.get_vertical_winning_mark).to eq('X')
  end

  it "should check for a diagonal win" do
    @board.grid = [['X', nil, nil],
                   [nil, 'X', nil],
                   [nil, nil, 'X']]
    expect(@current_game.get_diagonal_winning_mark).to eq('X')
  end

  it "should check for a diagonal win" do
    @board.grid = [[nil, nil, 'X'],
                   [nil, 'X', nil],
                   ['X', nil, nil]]
    expect(@current_game.get_diagonal_winning_mark).to eq('X')
  end

  it "should check for a tie" do
    @board.grid = [['O', 'X', 'X'],
                   ['X', 'O', 'O'],
                   ['X', 'O', 'X']]
    expect(@current_game.is_tie).to eq(true)
  end

  it "should check for a tie with empty spaces" do
    @board.grid = [['O', 'X', 'X'],
                   ['X', 'O', 'O'],
                   ['X', 'O', nil]]
    expect(@current_game.is_tie).to eq(false)
  end

  it "should check for a tie without empty spaces" do
    @board.grid = [['O', 'O', 'X'],
                   ['X', 'O', 'O'],
                   ['X', 'O', 'X']]
    expect(@current_game.is_tie).to eq(false)
  end

end