class Api::V1::TeamsController < ApplicationController

  before_action :find_team, only: [:show]

  def index
    @teams = Team.all
    render json: @teams, include: ['games']

  end

  def show
    render json: @team, include: ['games']
  end

  def create
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
