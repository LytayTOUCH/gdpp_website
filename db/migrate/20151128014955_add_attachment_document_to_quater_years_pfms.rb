class AddAttachmentDocumentToQuaterYearsPfms < ActiveRecord::Migration
  def self.up
    change_table :quater_years_pfms do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :quater_years_pfms, :document
  end
end
