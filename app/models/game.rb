class Game < ApplicationRecord
  belongs_to :series
  has_many :user_games
end
