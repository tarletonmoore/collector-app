class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :console
      t.string :year
      t.integer :price
      t.integer :series_id

      t.timestamps
    end
  end
end
