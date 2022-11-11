class AddColumnToCommentOnProductsTable < ActiveRecord::Migration[6.1]
  def change
    add_column :comment_on_products, :reply_id, :integer
  end
end
