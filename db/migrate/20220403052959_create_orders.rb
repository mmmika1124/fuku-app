class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id, null: false
      t.integer :total_payment, null: false
      t.integer :payment_method, default: 0, null: false

      t.timestamps
    end
  end
end
