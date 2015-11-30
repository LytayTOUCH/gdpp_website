class AddAttachmentDocumentToPurchaseOrders < ActiveRecord::Migration
  def self.up
    change_table :purchase_orders do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :purchase_orders, :document
  end
end
