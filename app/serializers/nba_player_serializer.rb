class NbaPlayerSerializer < ActiveModel::Serializer
  has_many :comparisons
  has_many :users, through: :comparisons
  attributes :id, :first_name, :last_name, :person_id, :position, :height_feet, :height_inches, :team_id
end
