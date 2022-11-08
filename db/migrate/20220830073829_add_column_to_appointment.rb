class AddColumnToAppointment < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :patient_name, :string
    add_column :appointments, :physician_name, :string
  end
end
