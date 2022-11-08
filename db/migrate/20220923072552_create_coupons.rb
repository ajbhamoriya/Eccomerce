class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.string :code
      t.decimal :discount
      t.decimal :min_cart_value
      t.string :discount_type
      t.timestamps
    end
  end
end
