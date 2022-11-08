class AddFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :contact_number, :integer
    add_column :users, :date_of_birth, :date
    add_column :users, :address, :string
  end
end
