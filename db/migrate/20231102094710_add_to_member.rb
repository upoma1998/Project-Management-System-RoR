class AddToMember < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :first_name, :string
  end
end
