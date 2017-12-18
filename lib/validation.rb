#purpose of this module is to verify that input is an integer within 1-9 range else continue to prompt until input is valid
module Validation

  def self.handle_player_input(error_msg, action,player_input)
    if !valid_player_input?(player_input)
      error_msg
      action
    else
      player_input
    end
  end

  def self.valid_player_input?(player_input)
    player_input.integer? && player_input.between?(1,9)
  end

end
