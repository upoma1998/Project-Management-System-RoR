class AddToAdmin < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :username, :string
  end
end
