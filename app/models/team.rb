class Team < ApplicationRecord
    belongs_to :group
    has_many :games, through: :game_teams
    has_many :users, through: :games
end
