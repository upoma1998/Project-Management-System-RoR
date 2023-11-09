class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    remove_column :members, :organization_id, :integer
  end
end
