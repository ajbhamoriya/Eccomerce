class ChangeColumnIn < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :total, :float
    change_column :order_items, :price, :float
    change_column :carts, :total, :float
    change_column :cart_items, :price, :float
    change_column :carts, :discount, :integer
    change_column :orders, :discount, :integer
    change_column :products, :price, :float
  end
end
