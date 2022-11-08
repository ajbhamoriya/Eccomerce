class RemoveColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :Demos, :d_id, :integer
  end
end
