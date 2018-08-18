class Api::V1::NbaPlayersController < ApplicationController

before_action :find_player, only: [:show, :update]

 def index
   # @nba_players_top = NbaPlayer.all.select { |player| player.pie >= "0.15" && player.person_id != 201951 && player.person_id != 202688 && player.person_id != 201582}.sample(2)
   # @nba_players_mid = NbaPlayer.all.select { |player| player.pie > "0.10" && player.pie < "0.15" && player.person_id != 201951 && player.person_id != 202688 && player.person_id != 201951}.sample(2)
   # @nba_players_rest = NbaPlayer.all.select { |player| player.pie <= "0.1" && player.person_id != 201951 && player.person_id != 202688 && player.person_id != 201582}.sample(1)



   # @nba_players = @nba_players_top + @nba_players_mid + @nba_players_rest





   @nba_players = NbaPlayer.all.select { |player| player.pie == "undefined" && player.person_id != 201951 && player.person_id != 202688 && player.person_id != 201582}.sample(12)
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
  params.permit(:id, :offrtg, :dfrtg, :pie, :usg)

end

end
