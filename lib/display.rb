class Display

  attr_accessor :input, :output

  def initialize(input=STDIN, output=STDOUT)
    @input = input
    @output = output
  end

#public methods used by Game Session
  def print_welcome
    display_message("Welcome to TicTacToe! Player 1 is 'X' and Player 2 is 'O'.\n")
  end

  def get_board_size
    display_message("Please provide a number for the board size to build a proportional board: ")
    get_player_input.to_i
  end

  def print_game_board(board_content)
    # ex: ["X", "02", "03", "04", "05", "06", "07", "08", "09"]
    formatted_content = format_numbers(board_content)
    row_length = Math.sqrt(formatted_content.length)
    board = "\n"

    formatted_content.each_with_index do |item, index|
      if (index + 1) % row_length == 0
        board = board + "_#{item}_|" + "\n\n"
      else
        board = board + "_#{item}_|"
      end
    end

    display_message(board)
  end

  def print_current_player_turn(player)
    display_message("Player#{player.mark}'s turn: ")
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

#helper/private methods below
private
  def format_numbers(board_content)
    board_content.reduce([]) do|formatted, item|
      formatted.push(prepend_leading_zero(item) || item)
    end
  end

  def prepend_leading_zero(item)
    if item.is_a? String
      item
    elsif item.integer? && item.digits.count == 1
      "%02d" % item
    end
  end

  def display_message(msg)
    @output.print msg
  end

  def get_player_input
    @input.gets
  end

end
