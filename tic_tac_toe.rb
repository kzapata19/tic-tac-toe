require './lib/game_session'
require './lib/player'
require './lib/board'
require './lib/outcome'
require './lib/display'

player1 = Player.new(' X')
player2 = Player.new(' O')
display1 = Display.new
outcome = Outcome.new

game_session = GameSession.new(player1, player2, display1, outcome)
game_session.start_game
