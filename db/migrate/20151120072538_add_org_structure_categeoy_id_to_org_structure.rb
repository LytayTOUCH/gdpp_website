class AddOrgStructureCategeoyIdToOrgStructure < ActiveRecord::Migration
  def change
    add_reference :org_structures, :org_structure_category, index: true, foreign_key: true
  end
end
