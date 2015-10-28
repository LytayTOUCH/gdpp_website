class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :title
      t.string :description
      t.references :announcement_type, index: true, foreign_key: true
      t.references :procurement_entity, index: true, foreign_key: true
      t.references :budget_source, index: true, foreign_key: true
      t.date :open_register_date
      t.date :close_submit_date
      t.date :open_bid_doc_date
      t.boolean :public

      t.timestamps null: false
    end
  end
end
