class Mig1AddForTask < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :tasks, :members
  end
end
