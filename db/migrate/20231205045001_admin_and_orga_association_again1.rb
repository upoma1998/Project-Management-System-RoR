class AdminAndOrgaAssociationAgain1 < ActiveRecord::Migration[7.0]
  def change
    add_reference :organizations, :admin, index: true
  end
end
