class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :platform_id
      t.integer :genre_id
      t.integer :target_age_id
      t.string :game_name
      t.text :game_introduction
      t.integer :price
      t.timestamps
    end
  end
end
