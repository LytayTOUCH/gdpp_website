class CreateProcurementMethods < ActiveRecord::Migration
  def change
    create_table :procurement_methods do |t|
      t.string :name, limit: 80, null: false

      t.timestamps null: false
    end
  end
end
