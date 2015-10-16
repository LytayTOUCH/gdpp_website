class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.integer :admin_id
      t.string :name
      t.string :address
      t.string :phone
      t.string :position

      t.timestamps null: false
    end
  end
end
