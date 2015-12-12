class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :address
      t.string :phone
      t.string :phone
      t.string :fax
      t.string :email
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
