class Team < ApplicationRecord
    belongs_to :group, optional: true
    has_many :game_teams
    has_many :games, through: :game_teams
    has_many :users, through: :games
end
