class AddColumnsToCart < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :coupon_id, :integer
    add_column :carts, :discount, :decimal
  end
end
