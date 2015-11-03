class OrgStructure < ActiveRecord::Base
  validates :title, presence: true

  has_attached_file :org_structure_image, :url => "/:class/:attachment/:id/:basename.:extension", :path => ":rails_root/public/:class/:attachment/:id/:basename.:extension" 

  validates_attachment :org_structure_image, :content_type => { :content_type => ["image/jpeg", "image/jpg", "image/gif", "image/png"] }
end
