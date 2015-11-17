class CreateImageSlides < ActiveRecord::Migration
  def change
    create_table :image_slides do |t|
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
