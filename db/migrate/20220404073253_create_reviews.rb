class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.integer :customer_id, null: false
      t.integer :item_id, null: false
      t.integer :age, null: false
      t.integer :height, null: false
      t.integer :figure, null: false
      t.integer :score, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
