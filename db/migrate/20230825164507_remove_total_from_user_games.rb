class RemoveTotalFromUserGames < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_games, :total, :decimal, precision: 8, scale: 2
  end
end
