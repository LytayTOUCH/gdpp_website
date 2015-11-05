class CreateProcurementPlans < ActiveRecord::Migration
  def change
    create_table :procurement_plans do |t|
      t.string :name
      t.references :procurement_entity, index: true, foreign_key: true
      t.string :year

      t.timestamps null: false
    end
  end
end
