class AddProcurementPlanTypeToProcurementPlan < ActiveRecord::Migration
  def change
    add_column :procurement_plans, :procurement_plan_type, :string
  end
end
