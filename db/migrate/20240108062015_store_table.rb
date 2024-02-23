class StoreTable < ActiveRecord::Migration[7.0]
  def change
    add_column :stores, :email, :string, null:false
    add_column :stores, :password, :string, null:false
    add_column :stores, :confirm_password, :string, null:false
    add_column :stores, :name, :string, null:false
  end
end
