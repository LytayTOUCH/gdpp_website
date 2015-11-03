class CreateOrgStructures < ActiveRecord::Migration
  def change
    create_table :org_structures do |t|
      t.string :title, null: false
      t.text :description
      t.attachment :org_structure_image 

      t.timestamps null: false
    end
  end
end
