class ChangeColumnFromUserModel < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :token, :string
  end
end
