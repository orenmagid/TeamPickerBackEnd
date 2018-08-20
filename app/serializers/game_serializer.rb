class GameSerializer < ActiveModel::Serializer
  belongs_to :user
  has_many :game_teams
  has_many :teams, through: :game_teams
  attributes :id, :date, :location, :user_id
end
