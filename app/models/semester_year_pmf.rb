class SemesterYearPmf < ActiveRecord::Base
  validates :title, presence: true

  has_attached_file :file_attachment, :url => "/:class/:attachment/:id/:basename.:extension", :path => ":rails_root/public/:class/:attachment/:id/:basename.:extension" 

  validates_attachment :file_attachment, :content_type => { :content_type => ["image/jpeg", "image/jpg", "image/gif", "image/png", 
    "application/pdf", "application/vnd.ms-excel", 
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", 
    "application/msword", 
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document"] }
  validates_attachment_size :file_attachment, less_than: 10.megabytes  
end
