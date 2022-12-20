class StringToBigint < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
    dir.up do
      change_column :libraries, :book, :bigint
    end
    dir.down do
      change_column :libraries, :book, :string
    end
  end
  end
end