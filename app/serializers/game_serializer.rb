class GameSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :team
  attributes :id, :date, :location, :user_id, :team_id
end
