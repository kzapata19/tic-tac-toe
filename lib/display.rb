class Display

  attr_reader :input, :output

  def initialize(input=STDIN, output=STDOUT)
    @input = input
    @output = output
  end

  def print_welcome
    display_message("Welcome to TicTacToe! Player 1 is 'X' and Player 2 is 'O'.")
  end

  def get_board_size
    display_message("Please provide a number for the board size to build a proportional board: ")
    get_player_input.to_i
  end

  def print_current_player_turn(player)
    display_message("Player #{player.mark}'s turn: ")
  end

  def print_interim_msg
    display_message("No winner or tie yet...")
  end

  def print_winner(player)
    display_message("#{player.mark} is the winner!\n")
  end

  def print_tie
    display_message("No winner. Tie game!\n")
  end

  def display_message(msg)
    @output.print msg
  end

  def get_player_input
    @input.gets
  end

end
