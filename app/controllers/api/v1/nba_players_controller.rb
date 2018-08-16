class Api::V1::NbaPlayersController < ApplicationController

before_action :find_player, only: [:show, :update]

 def index
   @nba_players = NbaPlayer.all
   render json: @nba_players
 end

 def show

   render json: @nba_player
 end

 def update
    @nba_player.update(nba_player_params)
    if @nba_player.save
      render json: @nba_player, status: :accepted
    else
      render json: { errors: @nba_player.errors.full_messages }, status: :unprocessible_entity
    end
end


 private



 def find_player
   @nba_player = NbaPlayer.find(params[:id])
 end

 def nba_player_params
 params.require(:nba_player).permit(:id, :pie)

end

end
