class AddNameToCartItem < ActiveRecord::Migration[6.1]
  def change
    remove_column :carts, :product_id, :integer
    add_column :cart_items, :name, :string
  end
end
