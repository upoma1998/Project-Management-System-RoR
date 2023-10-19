class AddJtiToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null:false
    add_column :users, :plan, :string, null:false
    add_column :users, :jti, :string, null:false
    add_index :users, :jti, unique: true
  end
end
