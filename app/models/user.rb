class User < ApplicationRecord
    validates :username, uniqueness: true
    validates_presence_of :name, :username, :age, :height

    has_many :games
    has_many :teams, through: :games
    has_many :comparisons
    has_many :nba_players, through: :comparisons
    has_many :user_groups
    has_many :groups, through: :user_groups
end
