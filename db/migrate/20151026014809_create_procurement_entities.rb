class CreateProcurementEntities < ActiveRecord::Migration
  def change
    create_table :procurement_entities do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
