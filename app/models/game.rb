class Game < ApplicationRecord
  has_many :game_teams
  has_many :teams, through: :game_teams
  belongs_to :user, optional: true
end
