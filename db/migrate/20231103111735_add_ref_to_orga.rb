class AddRefToOrga < ActiveRecord::Migration[7.0]
  def change
    add_reference :paid_projects, :organization, index: true
  end
end
