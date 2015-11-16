class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :location_name, limit: 80, null: false
      t.string :email_one
      t.string :email_two
      t.string :email_three
      t.string :phone_one
      t.string :phone_two
      t.string :phone_three
      t.text :address_one
      t.text :address_two
      t.text :address_three

      t.timestamps null: false
    end
  end
end
