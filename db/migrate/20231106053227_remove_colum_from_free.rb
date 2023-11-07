class RemoveColumFromFree < ActiveRecord::Migration[7.0]
  def change
    remove_column :free_projects, :user_id, :integer
    remove_column :paid_projects, :user_id, :integer
  end
end
