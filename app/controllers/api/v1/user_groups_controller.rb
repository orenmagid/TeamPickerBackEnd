class Api::V1::UserGroupsController < ApplicationController





  def delete
    @team = Team.new(team_params)
    if @team.save
      render json: @team, status: :accepted
    else
      render json: { errors: @team.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def team_params
    params.require(:team).permit(:group_id, :id)

  end

  def find_team
    @team = Team.find(params[:id])

  end
end
