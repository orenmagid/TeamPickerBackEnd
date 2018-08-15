class Team < ApplicationRecord
    belongs_to :group
    has_many :games
    has_many :users, through: :games
end
