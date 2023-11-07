class AddFieldsToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :assigned_task, :string
    add_column :tasks, :total_time, :string
    add_column :tasks, :completed_task, :string
    add_column :tasks, :incomplete_task, :string
    add_column :tasks, :time_needed, :string
    add_column :tasks, :dependency_on_member_name, :string
  end
end
