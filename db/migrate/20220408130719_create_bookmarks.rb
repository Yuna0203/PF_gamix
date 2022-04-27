class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.references :customer, foreign_key: true
      t.integer :game_id, null: false
      t.timestamps
    end
  end
end
