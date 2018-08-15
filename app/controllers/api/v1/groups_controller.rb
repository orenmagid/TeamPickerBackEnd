class Api::V1::GroupsController < ApplicationController

  before_action :find_team, only: [:show]

  def index
    @groups = Group.all
    render json: @groups, include: ['comparisons']

  end

  def show
    render json: @group, include: ['comparisons']
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      render json: @group, status: :accepted
    else
      render json: { errors: @group.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :id)

  end

  def find_group
    @group = Group.find(params[:id])

  end


end
