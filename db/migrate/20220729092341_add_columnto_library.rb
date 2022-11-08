class AddColumntoLibrary < ActiveRecord::Migration[6.1]
  def change
    add_column :libraries, :book, :string
    add_column :libraries, :author, :string
  end
end
