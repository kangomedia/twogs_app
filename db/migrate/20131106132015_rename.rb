class Rename < ActiveRecord::Migration
  def change
    rename_column :assignments, :timesheet_id_integer, :timesheet_id
    change_column :assignments, :timesheet_id, :integer
  end
end
