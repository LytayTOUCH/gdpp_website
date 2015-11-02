class AddAttachmentBiddingFileToAnnouncements < ActiveRecord::Migration
  def self.up
    change_table :announcements do |t|
      t.attachment :bidding_file
    end
  end

  def self.down
    remove_attachment :announcements, :bidding_file
  end
end
