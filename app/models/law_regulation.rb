class LawRegulation < ActiveRecord::Base
  belongs_to :law_category

  has_attached_file :thumbnail, :url => "/:class/:attachment/:id/:basename.:extension", :path => ":rails_root/public/:class/:attachment/:id/:basename.:extension"
  has_attached_file :law_doc_attachment, :url => "/:class/:attachment/:id/:basename.:extension", :path => ":rails_root/public/:class/:attachment/:id/:basename.:extension" 

  validates_attachment :thumbnail, :law_doc_attachment, :content_type => { :content_type => [
    "image/jpeg", "image/jpg", "image/gif", "image/png", 
    "application/pdf", "application/vnd.ms-excel", 
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", 
    "application/msword", 
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document"] }

    scope :sorted_by_date, -> {order ("law_regulations.updated_at DESC")}

  validates_attachment_size :law_doc_attachment, less_than: 10.megabytes  

  validates :title, presence: true

  scope :royal_decree, lambda { |id| where(:id => id) }

end
