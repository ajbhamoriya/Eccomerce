class AddSIdToColleges < ActiveRecord::Migration[6.1]
  def change
    add_column :colleges, :s_id, :integer
  end
end
