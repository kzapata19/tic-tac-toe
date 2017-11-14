require './lib/game_session'
require './lib/player'
require './lib/board'
require './lib/rules'
require './lib/display'


player1 = Player.new("X")
player2 = Player.new("O")
board = Board.new(3, 3)
rules = Rules.new(board)
display1 = Display.new(board)
translator = setup_translator
current_player = player1
GameSession.new(player1, player2, board, rules, display1);
