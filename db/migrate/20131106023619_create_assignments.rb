class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :workday_id
      t.integer :employee_id
      t.string :timesheet_id_integer
      t.integer :job_id
      t.datetime :date
      t.string :hours

      t.timestamps
    end
  end
end
