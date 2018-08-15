class Group < ApplicationRecord
    has_many :teams
    has_many :comparisons
    has_many :users, through: :comparisons
end
