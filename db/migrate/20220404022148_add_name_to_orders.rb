class AddNameToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :name, :string, null: false
  end
end
