class AddRedToOrga < ActiveRecord::Migration[7.0]
  def change
    add_reference :free_projects, :organization, index: true
  end
end
