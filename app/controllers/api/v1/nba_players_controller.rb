class Api::V1::NbaPlayersController < ApplicationController

before_action :find_player, only: [:show]

 def index
   @nba_players = NbaPlayer.all
   render json: @nba_players
 end

 def show

   render json: @nba_player
 end


 private



 def find_player
   @nba_player = NbaPlayer.find(params[:id])
 end

end
