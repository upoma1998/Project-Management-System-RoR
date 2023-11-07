class AddFieldOrga < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :name, :string
  end
end
