class AddColumn2ToAppointment < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :cancel, :boolean,default: false
  end
end
