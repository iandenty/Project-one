class Score < ActiveRecord::Base
  attr_accessible :draw, :game_id, :player1_win, :player2_win
  belongs_to :game
end
