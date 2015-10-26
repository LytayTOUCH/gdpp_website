class CreateAnnouncementTypes < ActiveRecord::Migration
  def change
    create_table :announcement_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
