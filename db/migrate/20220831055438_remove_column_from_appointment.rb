class RemoveColumnFromAppointment < ActiveRecord::Migration[6.1]
  def change
    remove_column :appointments, :cancel, :boolean
  end
end
