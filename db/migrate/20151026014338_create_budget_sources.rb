class CreateBudgetSources < ActiveRecord::Migration
  def change
    create_table :budget_sources do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
