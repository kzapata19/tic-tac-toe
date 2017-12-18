require './lib/game_session'
require './lib/player'
require './lib/board'
require './lib/rules'
require './lib/display'
# require './lib/validation'

player1 = Player.new("X")
player2 = Player.new("O")
# board = Board.new
# rules = Rules.new(board)
display1 = Display.new
# game_session = GameSession.new({player1: player1, player2: player2, board: board, rules: rules, display1: display1})

game_session = GameSession.new(player1, player2, display1)
game_session.start_game
