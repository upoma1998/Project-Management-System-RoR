class AddRefToMemTask < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :member, index: true
  end
end
