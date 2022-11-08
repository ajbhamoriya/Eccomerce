class CreateDemo < ActiveRecord::Migration[6.1]
  def change
    create_table :demos do |t|
      t.string :name
      t.integer :d_id
      t.timestamps
    end
  end
end
