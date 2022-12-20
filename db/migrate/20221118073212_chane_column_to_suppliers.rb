class ChaneColumnToSuppliers < ActiveRecord::Migration[6.1]
  def change
    change_column :suppliers, :name, :bigint
  end
end
