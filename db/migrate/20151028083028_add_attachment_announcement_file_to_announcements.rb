class AddAttachmentAnnouncementFileToAnnouncements < ActiveRecord::Migration
  def self.up
    change_table :announcements do |t|
      t.attachment :announcement_file
    end
  end

  def self.down
    remove_attachment :announcements, :announcement_file
  end
end
