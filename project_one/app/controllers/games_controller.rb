class GamesController < ApplicationController
  # GET /games
  # GET /games.json
  def index
    # @games = Game.all      
    @games = Game.order('created_at DESC').page(params[:page])

    respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @games }
      end
    end

    def make_move
      @game = Game.find params[:id]
      if @game.your_turn?(current_player.id)
        @game.next_move(params[:player_move], current_player.id, @game.player2_id)
        current_moves_array = @game.moves.where(player_id: current_player.id).pluck(:player_move)
        total_moves = @game.moves.count
        if @game.is_computer?(@game.player2_id)
          computer_moves_array = @game.moves.where(player_id: @game.player2_id).pluck(:player_move)
          if @game.is_win?(computer_moves_array)
            s = Score.create(game_id: @game.id, player2_win: true)
            redirect_to @game, notice: "The computer is the winner!" and return
          else
            redirect_to @game
          end
        elsif @game.is_win?(current_moves_array)
          if @game.moves.first[:player_id] == @game.player1_id
            s = Score.create(game_id: @game.id, player1_win: true)
            redirect_to @game, notice: "#{Move.last.player.name} is the winner!"
          else
            s = Score.create(game_id: @game.id, player2_win: true)
            redirect_to @game, notice: "#{Move.last.player.name} is the winner!"
          end
        elsif @game.is_draw?(total_moves)
          s = Score.create(game_id: @game.id, draw: true)
          redirect_to @game, notice: 'draw!'
        else
          redirect_to @game
        end
      end
    end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    @game = Game.new
    @game.player1_id = current_player.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(params[:game])
    @game.player1_id = current_player.id
    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render json: @game, status: :created, location: @game }
      else
        format.html { render action: "new" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end


  # def example_method
  #   @game=  Game.find(1)
  #   result = @game.is_won # then this method returns an integer 
  #   if result == 1

  #   elsif result == 2

  #   elsif result == 3

  #   end

    # etc...


  # end
end
