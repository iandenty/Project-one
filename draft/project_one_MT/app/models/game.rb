class Game < ActiveRecord::Base
  attr_accessible :player1_id, :player2_id
  belongs_to :player1, class_name: 'Player'
  belongs_to :player2, class_name: 'Player'
  has_many :scores
  has_many :moves

@winning_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

@player_turn = 0

# player1_num_moves = 0
# player2_num_moves = 0
# cpu_num_moves = 0

# @total_player1_moves = []
# @total_player2_moves = []
# @total_cpu_moves = []

# def who_goes_first
#   [player1_id, player2_id].sample
#   #Flash the players name who goes first
#   #CALL PLAYER1 _MOVE METHOD
# end
# end


def first_move(params) 
binding.pry 
  Move.new(player_move: params[:player_move], game_id: params[:id], player_id: Game.find(params[:id]).player1_id)
end

def next_move
  unless Move.last.player_id
    Move.new(player_move: params[:player_move], game_id: params[:id], player_id: Game.find(params[:id]).player2_id)
end
end

# def player1_moves
#   Mo

# end

# def player2_moves
# end


# def player1_move
  
#     #GET INPUT FROM THE FORM AND ADD TO THE APPROPRIATE TOTAL PLAYER MOVES VARAIBLE
#     #STORE RESULT IN MOVES DATABASE
# end

# def wait_turn
 
#     #GET INPUT FROM THE FORM AND ADD TO THE APPROPRIATE TOTAL PLAYER MOVES VARAIBLE
#     #STORE RESULT IN MOVES DATABASE
  
#   end

  

#   def check_result
#     #WHERE PLAYER_ID AND GAME ID EQUAL THIS GAME, PULL OUT MOVES AND SORT    
#     if @winning_combinations.include? total_player1_moves.sort
#       game_over
#     elsif @winning_combinations.include? total_player2_moves.sort
#       game_over
#     else
#     end
#   end

#   def game_over

#   end


end
