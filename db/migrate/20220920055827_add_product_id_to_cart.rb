class AddProductIdToCart < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :product_id, :integer
  end
end
