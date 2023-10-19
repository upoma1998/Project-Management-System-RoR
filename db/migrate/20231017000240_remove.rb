class Remove < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :name, :string, null:false
    remove_column :users, :plan, :string, null:false
  end
end
