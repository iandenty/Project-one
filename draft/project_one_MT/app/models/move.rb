class Move < ActiveRecord::Base
  attr_accessible :game_id, :player_id, :player_move
  belongs_to :game
  belongs_to :player
end
