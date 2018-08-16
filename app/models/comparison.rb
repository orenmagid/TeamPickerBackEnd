class Comparison < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :nba_player, optional: true
    belongs_to :group, optional: true
end
