class TeamSerializer < ActiveModel::Serializer
  belongs_to :group
  has_many :games
  has_many :users, through: :games
  attributes :id, :group_id
end
