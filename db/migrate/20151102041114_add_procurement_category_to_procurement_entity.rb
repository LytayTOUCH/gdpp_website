class AddProcurementCategoryToProcurementEntity < ActiveRecord::Migration
  def change
    add_reference :procurement_entities, :procurement_category, index: true, foreign_key: true
  end
end
