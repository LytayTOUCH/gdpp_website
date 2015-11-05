class CreateProcurementEntities < ActiveRecord::Migration
  def change
    create_table :procurement_entities do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :website
      t.timestamps null: false
    end
  end
end
