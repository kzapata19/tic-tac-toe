require './lib/game_session'
require './lib/player'
require './lib/board'
require './lib/rules'
require './lib/display'
# require './lib/validation'

player1 = Player.new("X")
player2 = Player.new("O")
board = Board.new
rules = Rules.new(board)
display1 = Display.new(board)
game_session = GameSession.new(player1, player2, board, rules, display1)
game_session.start_game
