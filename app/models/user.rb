class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :user_games
  has_many :games, through: :user_games

  def total
    calc_total = 0

    games.each do |game|
      calc_total += game.price.to_i
    end
    p calc_total
  end
end
