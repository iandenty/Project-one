class Game < ActiveRecord::Base
  attr_accessible :player1_id, :player2_id
  belongs_to :player1, class_name: 'Player'
  belongs_to :player2, class_name: 'Player'
  has_many :scores
  has_many :moves

  WINNING_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].to_set

  def your_turn?(current_player_id)
    last_move = self.moves.last
    return true if last_move.nil?
    last_move.player_id == current_player_id
  end

  def next_move(player_move, current_player)
    self.moves.create(player_move: player_move, player_id: current_player)
  end

  def is_win?(current_moves_array)
    WINNING_COMBINATIONS.any? {|subset| current_moves_array.to_set.superset? subset.to_set}
  end

  def is_draw?(total_moves)
    total_moves > 8
  end

end
