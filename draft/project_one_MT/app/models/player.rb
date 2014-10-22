class Player < ActiveRecord::Base
  attr_accessible :image, :name
  has_many :games_as_player1, foreign_key: :player1_id, class_name: 'Game'
  has_many :games_as_player2, foreign_key: :player2_id, class_name: 'Game'
  has_many :moves
end
