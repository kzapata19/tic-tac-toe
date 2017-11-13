describe Game do

  before(:each) do
    @board = Board.new(3, 3)

    @current_game =  Game.new(@board)
  end

  it "should display the board" do
    expect(@current_game.display_board).to eq([[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
  end

  it "should check for a horizontal win" do
    @board.grid = [['X', 'X', 'X'],
                   [nil, nil, nil],
                   [nil, nil, nil]]
    expect(@current_game.has_horizontal_win).to eq(true)
  end

  it "should check for a vertical win" do
    @board.grid = [['X', nil, nil],
                   ['X', nil, nil],
                   ['X', nil, nil]]
    expect(@current_game.has_vertical_win).to eq(true)
  end

  it "should check for a diagonal win" do
    @board.grid = [['X', nil, nil],
                   [nil, 'X', nil],
                   [nil, nil, 'X']]
    expect(@current_game.has_diagonal_win).to eq(true)
  end

  it "should check for a diagonal win" do
    @board.grid = [[nil, nil, 'X'],
                   [nil, 'X', nil],
                   ['X', nil, nil]]
    expect(@current_game.has_diagonal_win).to eq(true)
  end
end