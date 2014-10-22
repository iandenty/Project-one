module ApplicationHelper
  def cell_submit_tag game, number, current_player
    move = game.moves.where(player_move: number)
    value = if game.moves.pluck(:player_move).include?(number)
      if game.moves.where(player_move: number).first.player_id == game.player1_id
        "x"
      else
        "o"
      end
    else
      " "
    end

    if game.your_turn?(current_player.id) && !move.present?
      submit_tag value
    else
      value
    end
  end
end
