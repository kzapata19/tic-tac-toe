require './lib/game_session'
require './lib/player'
require './lib/board'
require './lib/rules'
require './lib/display'

player1 = Player.new("X")
player2 = Player.new("O")
board = Board.new(3, 3)
rules = Rules.new(board)
display1 = Display.new
current_player = player1
GameSession.new(player1, player2, board, rules, display1)

=begin
  to play game in terminal
    - add "print" to display_board method in display.rb
    - inside game_session.rb uncomment:
      1.   start_game method: provide_move(@current_player)
      2.   provide_move method: location = gets.chomp.to_i

  This will
    1. print the stringified board after the welcome message
    2. will prompt for Player 1's move
    3. will then take move
    4. translate location for proper placement in nested array
    5. place in nested array
    6. print out updated stringied board to terminal
=end