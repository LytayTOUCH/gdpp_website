class CreateOrgStructureCategories < ActiveRecord::Migration
  def change
    create_table :org_structure_categories do |t|
      t.string :name, limit: 80, null: false

      t.timestamps null: false
    end
  end
end
