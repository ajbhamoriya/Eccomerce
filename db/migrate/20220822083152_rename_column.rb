class RenameColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :demos, :first_name, :f_name    
  end
end
