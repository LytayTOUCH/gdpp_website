class AddAttachmentLogoToProcurementEntities < ActiveRecord::Migration
  def self.up
    change_table :procurement_entities do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :procurement_entities, :logo
  end
end
