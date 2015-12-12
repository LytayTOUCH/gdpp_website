class AddZoomLevelToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :zoom_level, :integer
  end
end
