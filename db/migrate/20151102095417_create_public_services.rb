class CreatePublicServices < ActiveRecord::Migration
  def change
    create_table :public_services do |t|
      t.string :name
      t.string :position
      t.string :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
