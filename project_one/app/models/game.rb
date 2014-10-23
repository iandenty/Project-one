class Game < ActiveRecord::Base
  attr_accessible :player1_id, :player2_id
  belongs_to :player1, class_name: 'Player'
  belongs_to :player2, class_name: 'Player'
  has_many :scores
  has_many :moves

  WINNING_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].to_set
  POSSIBLE_MOVES = (0..8).to_a
  COMPUTER = (Player.where(name: 'Computer').first).id

  def your_turn?(current_player_id)
    last_move = self.moves.last

    return (self.player1_id == current_player_id) if last_move.nil? 
    !(last_move.player_id == current_player_id)
  end

  def next_move(player_move, current_player_id, player2_id)
    self.moves.create(player_move: player_move, player_id: current_player_id)
    current_moves_array = self.moves.where(player_id: current_player_id).pluck(:player_move)
    # puts "is win #{is_win?(current_moves_array)} -> #{Player.find(current_player_id).name} "
    if player2_id == COMPUTER && !is_win?(current_moves_array)
      self.moves.create(player_move: (POSSIBLE_MOVES - current_moves_array).sample, player_id: COMPUTER)
    end
  end

  def is_computer?(player2)
    player2 == COMPUTER
  end


  def is_win?(current_moves_array)
    WINNING_COMBINATIONS.any? {|subset| current_moves_array.to_set.superset? subset.to_set}
  end

  def is_draw?(total_moves)
    total_moves == 9
  end

end
