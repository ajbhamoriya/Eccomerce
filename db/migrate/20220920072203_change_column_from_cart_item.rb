class ChangeColumnFromCartItem < ActiveRecord::Migration[6.1]
  def change
    rename_column :cart_items, :stock_quantity, :quantity
  end
end
