class AddAttachmentProcurementPlanFileToProcurementPlans < ActiveRecord::Migration
  def self.up
    change_table :procurement_plans do |t|
      t.attachment :procurement_plan_file
    end
  end

  def self.down
    remove_attachment :procurement_plans, :procurement_plan_file
  end
end
