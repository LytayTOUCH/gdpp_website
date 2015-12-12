class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
      t.string :project_name, null: false
      t.references :procurement_method, index: true, foreign_key: true
      t.references :procurement_category, index: true, foreign_key: true
      t.date :purchase_order_date

      t.timestamps null: false
    end
  end
end
