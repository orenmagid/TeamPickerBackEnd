class ComparisonSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :nba_player
  belongs_to :group
  attributes :id, :user_id, :rater_id, :nba_player_id, :group_id
end
