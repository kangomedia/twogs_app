class AddStatusToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :status, :boolean, default: true
  end
end
