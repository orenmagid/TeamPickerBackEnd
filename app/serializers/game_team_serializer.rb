class GameTeamSerializer < ActiveModel::Serializer
  belongs_to :games
  belongs_to :teams
  attributes :id, :game_id, :team_id
end
