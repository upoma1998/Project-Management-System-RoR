class RemoveReference < ActiveRecord::Migration[7.0]
  def change
    remove_reference :organizations, :admins, index: true
  end
end
