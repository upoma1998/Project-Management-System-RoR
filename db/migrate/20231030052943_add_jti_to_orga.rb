class AddJtiToOrga < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :jti, :string, null:false
    add_index :organizations, :jti, unique: true
  end
end
