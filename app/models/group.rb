class Group < ApplicationRecord
    has_many :teams
    has_many :user_groups
    has_many :users, through: :user_groups
end
