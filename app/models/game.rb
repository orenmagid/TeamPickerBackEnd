class Game < ApplicationRecord
  has_many :team, through: :game_teams
  belongs_to :user, optional: true
end
