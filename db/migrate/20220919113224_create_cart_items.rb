class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :product_id
      t.decimal :price
      t.integer :stock_quantity
      t.timestamps
    end
  end
end
