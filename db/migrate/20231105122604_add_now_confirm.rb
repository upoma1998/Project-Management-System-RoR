class AddNowConfirm < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :confirm_password, :string
    add_column :organizations, :confirm_password, :string
    add_column :admins, :confirm_password, :string
  end
end
