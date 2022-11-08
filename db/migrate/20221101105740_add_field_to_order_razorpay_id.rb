class AddFieldToOrderRazorpayId < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :razorpay_order_id, :integer
  end
end
