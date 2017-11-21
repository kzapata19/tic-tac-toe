class Display

  attr_accessor :display_array, :display_message

  def initialize
    @display_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_board
    # remove print for tests
    display_message("\n
     _#{@display_array[0]}_|_#{@display_array[1]}_|_#{@display_array[2]}_\n

     _#{@display_array[3]}_|_#{@display_array[4]}_|_#{@display_array[5]}_\n

     _#{@display_array[6]}_|_#{@display_array[7]}_|_#{@display_array[8]}_\n\n")
  end

  # consider moving this method to Display since printing to standard out (and any other UI-related methods)

  def display_message(msg)

    display_output = StringIO.new(msg)
    $stdout = display_output
    $stdout.string
    # STDOUT.print $stdout.string
    return $stdout.read

  end

end
