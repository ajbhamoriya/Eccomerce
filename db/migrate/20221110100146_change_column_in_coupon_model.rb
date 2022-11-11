class ChangeColumnInCouponModel < ActiveRecord::Migration[6.1]
  def change
    change_column :coupons, :discount, :float
    change_column :coupons, :min_cart_value, :float
  end
end
