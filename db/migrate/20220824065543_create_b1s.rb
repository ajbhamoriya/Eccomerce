class CreateB1s < ActiveRecord::Migration[6.1]
  def change
    create_table :b1s do |t|
      t.datetime :publish_at
      t.timestamps
    end
  end
end
