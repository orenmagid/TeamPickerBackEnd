class Comparison < ApplicationRecord
    belongs_to :user
    belongs_to :nba_player
    belongs_to :group
end
