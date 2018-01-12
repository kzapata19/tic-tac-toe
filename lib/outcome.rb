class Outcome

  def is_tie?(all_move_combos, full_board_bool)
    full_board_bool && !winner?(all_move_combos) ? true : false
  end

  def winner?(all_move_combos)
    winner = false
    all_move_combos.each do |set_of_moves|
      if set_of_moves.uniq.length == 1
        winner = true
        break
      end
    end
    winner
  end

end
