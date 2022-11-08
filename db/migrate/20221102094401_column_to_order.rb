class ColumnToOrder < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :razorpay_order_id, :string
    add_column :orders, :razorpay_payment_id, :string
  end
end
