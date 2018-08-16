class GameTeam < ApplicationRecord
    belongs_to :game, optional: true
    belongs_to :team, optional: true
end
