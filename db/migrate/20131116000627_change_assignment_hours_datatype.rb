class ChangeAssignmentHoursDatatype < ActiveRecord::Migration
  def change
    change_column :assignments, :hours, :integer
  end
end
