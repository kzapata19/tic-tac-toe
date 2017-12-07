class Display

  attr_reader :output

  def initialize(output=STDOUT)
    @output = output
  end

  def display_message(msg)
    @output.print msg
  end

end
