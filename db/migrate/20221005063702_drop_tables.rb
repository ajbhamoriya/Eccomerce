class DropTables < ActiveRecord::Migration[6.1]
  def change
    drop_table :orders
    drop_table :order_items
  end
end
