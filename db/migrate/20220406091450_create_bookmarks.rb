class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|

      t.integer :customer_id, null: false
      t.integer :item_id, null: false

      t.index [:customer_id, :item_id], unique: true

      t.timestamps
    end
  end
end
