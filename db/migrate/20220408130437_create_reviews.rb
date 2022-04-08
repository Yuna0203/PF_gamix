class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :customer_id
      t.float :evaluation
      t.string :review_title
      t.string :review
      t.timestamps
    end
  end
end
