class CreateCommentOnProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :comment_on_products do |t|
      t.text :description
      t.integer :product_id
      t.integer :user_id
      t.timestamps
    end
  end
end
