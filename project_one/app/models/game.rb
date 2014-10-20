class Game < ActiveRecord::Base
  attr_accessible :player1_id, :player2_id
  belongs_to :player1, class_name: 'Player'
  belongs_to :player2, class_name: 'Player'
  has_many :scores
  has_many :moves
end
