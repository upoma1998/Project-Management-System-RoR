class CreatePaidProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :paid_projects do |t|
      t.string :project_name
      t.datetime :start_date
      t.datetime :completion_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
