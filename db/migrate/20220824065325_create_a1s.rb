class CreateA1s < ActiveRecord::Migration[6.1]
  def change
    create_table :a1s do |t|
    t.string :a1_name
    t.timestamps
    end
  end
end
