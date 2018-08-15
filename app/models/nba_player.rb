class NbaPlayer < ApplicationRecord
    has_many :comparisons
    has_many :users, through: :comparisons
end
