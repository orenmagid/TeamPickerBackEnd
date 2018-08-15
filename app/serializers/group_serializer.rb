class GroupSerializer < ActiveModel::Serializer
  has_many :teams
  has_many :comparisons
  has_many :users, through: :comparisons
  attributes :id, :name
end
