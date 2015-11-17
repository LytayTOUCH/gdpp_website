class AddAttachmentImageToImageSlides < ActiveRecord::Migration
  def self.up
    change_table :image_slides do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :image_slides, :image
  end
end
