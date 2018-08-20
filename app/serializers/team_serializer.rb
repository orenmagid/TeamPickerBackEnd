class TeamSerializer < ActiveModel::Serializer
  belongs_to :group
  has_many :game_teams
  has_many :games, through: :game_teams
  has_many :users, through: :games
  attributes :id, :group_id
end
