class AwardingContract < ActiveRecord::Base
  belongs_to :procurement_method

  validates :title, presence: true
  validates :procurement_method_id, presence: true

  has_attached_file :attachment_doc, :url => "/:class/:attachment/:id/:basename.:extension", :path => ":rails_root/public/:class/:attachment/:id/:basename.:extension" 

  validates_attachment :attachment_doc, :content_type => { :content_type => ["image/jpeg", "image/jpg", "image/gif", "image/png", 
    "application/pdf", "application/vnd.ms-excel", 
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", 
    "application/msword", 
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document"] }
  validates_attachment_size :attachment_doc, less_than: 10.megabytes  
end
