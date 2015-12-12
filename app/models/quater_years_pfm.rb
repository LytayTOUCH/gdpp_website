class QuaterYearsPfm < ActiveRecord::Base
  validates :title, presence: true
  validates :document, presence: true
  
  has_attached_file :document, 
  styles: { :thumb => ["100x100#", :png] },
  url: "/:class/:id/:style/:basename.:extension", 
  path: ":rails_root/public/:class/:id/:style/:basename.:extension"
  validates_attachment :document, :content_type => { :content_type => [
    "image/jpeg", "image/jpg", "image/gif", "image/png", 
    "application/pdf", "application/vnd.ms-excel", 
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", 
    "application/msword", 
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document"] },
     :size => { :in => 0..5.megabytes }
end
