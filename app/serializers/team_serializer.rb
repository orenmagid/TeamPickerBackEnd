class TeamSerializer < ActiveModel::Serializer
  has_many :games
  has_many :users, through: :games
  attributes :id
end
