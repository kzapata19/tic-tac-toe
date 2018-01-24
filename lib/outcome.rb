class Outcome

  def tie?(all_move_combos, is_board_full)
    is_board_full && !has_winner?(all_move_combos)
  end

  def has_winner?(all_move_combos)
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
