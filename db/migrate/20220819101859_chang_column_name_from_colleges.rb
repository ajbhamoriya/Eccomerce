class ChangColumnNameFromColleges < ActiveRecord::Migration[6.1]
  def change
    change_column :colleges, :name, :text
  end
end
