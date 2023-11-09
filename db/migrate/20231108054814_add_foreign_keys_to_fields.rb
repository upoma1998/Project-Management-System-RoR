class AddForeignKeysToFields < ActiveRecord::Migration[7.0]
  def change
   
    
    add_foreign_key :free_projects, :organizations
  end
end
