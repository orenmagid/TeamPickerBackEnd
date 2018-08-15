class User < ApplicationRecord
    has_many :games
    has_many :teams, through: :games
    has_many :comparisons
    has_many :nba_players, through: :comparisons
    has_many :groups, through: :comparisons
end