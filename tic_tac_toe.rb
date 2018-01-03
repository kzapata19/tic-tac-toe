require './lib/game_session'
require './lib/player'
require './lib/board'
require './lib/rules'
require './lib/display'

player1 = Player.new(' X')
player2 = Player.new(' O')
display1 = Display.new
rules = Rules.new

game_session = GameSession.new(player1, player2, display1, rules)
game_session.start_game
