class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :coupon_id
      t.decimal :discount
      t.decimal :total
      t.timestamps
    end
  end
end
