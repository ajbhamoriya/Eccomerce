class ChangeColumn < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      dir.up do
        change_column :Demos, :name, :text
      end
      dir.down do
        change_column :Demos, :name, :string
      end
    end
  end 
end

