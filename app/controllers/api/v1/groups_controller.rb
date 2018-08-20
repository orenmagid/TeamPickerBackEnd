class Api::V1::GroupsController < ApplicationController

  before_action :find_group, only: [:show, :update]

  def index
    @groups = Group.all
    render json: @groups, include: ['users']

  end

  def show
    render json: @group, include: ['users']
  end

  def create
    @group = Group.new(group_params)
    @user = User.find(params[:user_id])

    if @group.save
      @group.users << @user
      render json: @group, status: :accepted
    else
      render json: { errors: @group.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    if params[:user_id]
        @user = User.find(params[:user_id])
    elsif params[:username]
      @user = User.find_by(username: params[:username])
    end

    if params[:name]
      if params[:name] == @group.name
        @group.users << @user
        @group.save
        render json: @group, status: :accepted
      else
        render json: { errors: @group.errors.full_messages }, status: :unprocessible_entity
      end
      if params[:username]
        @group.users << @user
        @group.save
        render json: @group, status: :accepted
      end
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
