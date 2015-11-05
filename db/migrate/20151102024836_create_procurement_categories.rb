class CreateProcurementCategories < ActiveRecord::Migration
  def change
    create_table :procurement_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
