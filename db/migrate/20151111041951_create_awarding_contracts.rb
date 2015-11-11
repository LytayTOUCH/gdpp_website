class CreateAwardingContracts < ActiveRecord::Migration
  def change
    create_table :awarding_contracts do |t|
      t.string :title, limit: 80, null: false
      t.text :description
      t.attachment :attachment_doc
      t.references :procurement_method, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
