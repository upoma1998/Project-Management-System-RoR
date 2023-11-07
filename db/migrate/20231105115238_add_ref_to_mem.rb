class AddRefToMem < ActiveRecord::Migration[7.0]
  def change
    add_reference :members, :organization, index: true
  end
end
