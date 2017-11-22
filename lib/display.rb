require 'pry'
class Display

  attr_accessor :display_array, :display_message

  def initialize
    @display_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_board
    display_message("\n
     _#{@display_array[0]}_|_#{@display_array[1]}_|_#{@display_array[2]}_\n

     _#{@display_array[3]}_|_#{@display_array[4]}_|_#{@display_array[5]}_\n

     _#{@display_array[6]}_|_#{@display_array[7]}_|_#{@display_array[8]}_\n\n")
  end

  def display_message(msg)
    $stdout = StringIO.new(msg)
    STDOUT.print $stdout.string
  end

end
