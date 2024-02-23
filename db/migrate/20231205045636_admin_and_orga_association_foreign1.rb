class AdminAndOrgaAssociationForeign1 < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :organizations, :admins
  end
end
