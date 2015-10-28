class CreateLawRegulations < ActiveRecord::Migration
  def change
    create_table :law_regulations do |t|
      t.string :title, limit: 50
      t.string :description
      t.attachment :thumbnail
      t.attachment :law_doc_attachment

      t.timestamps null: false
    end
  end
end
