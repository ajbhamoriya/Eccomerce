class AddFirstNameToDemo < ActiveRecord::Migration[6.1]
  def change
    add_column :Demos, :first_name, :string
    add_column :Demos, :last_name, :string
  end
end
