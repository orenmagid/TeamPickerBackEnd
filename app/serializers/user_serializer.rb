class UserSerializer < ActiveModel::Serializer
  has_many :games
  has_many :teams, through: :games
  attributes :id, :name, :height, :age
end
