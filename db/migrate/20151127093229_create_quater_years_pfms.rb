class CreateQuaterYearsPfms < ActiveRecord::Migration
  def change
    create_table :quater_years_pfms do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
