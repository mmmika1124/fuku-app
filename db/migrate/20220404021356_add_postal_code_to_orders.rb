class AddPostalCodeToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :postal_code, :string, null: false
  end
end
