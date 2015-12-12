class CreateSemesterYearPmfs < ActiveRecord::Migration
  def change
    create_table :semester_year_pmfs do |t|
      t.string :title, null: false
      t.string :year
      t.attachment :file_attachment

      t.timestamps null: false
    end
  end
end
