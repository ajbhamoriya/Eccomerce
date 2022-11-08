class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :name
      t.integer :contact_number
      t.string :email_id
      t.text :address
      t.integer :cart_id
      t.timestamps
    end
  end
end
