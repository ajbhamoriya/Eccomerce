class ChaneColumnInSuppliers < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      dir.up do
        change_column :suppliers, :name, :string
      end
      dir.down do
        change_column :suppliers, :name, :bigint
      end
    end
  end
end
