class Api::V1::ComparisonsController < ApplicationController
    before_action :find_comparison, only: [:show]

    def index
      @comparisons = Comparison.all
      render json: @comparisons, include: ['users','groups', 'nba_players']

    end

    def filtered_index
        @comparisons = Comparison.all.select{ |comparison| comparison.group_id == params[:id] }
        render json: @comparisons, include: ['users', 'nba_players']
    end

    # def show
    #   render json: @comparison, include: ['users','nba_players']
    # end

    def create
      @comparison = Comparison.new(comparison_params)
      if @comparison.save
        render json: @comparison, status: :accepted
      else
        render json: { errors: @comparison.errors.full_messages }, status: :unprocessible_entity
      end
    end

    private

    def comparison_params
      params.require(:comparison).permit(:id, :user_id, :rater_id, :group_id, :nba_player_id, :pie, :offrtg, :dfrtg, :usg)

    end

    def find_comparison
      @comparison = Comparison.find(params[:id])
    end
end
