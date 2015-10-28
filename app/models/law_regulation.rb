class LawRegulation < ActiveRecord::Base
  has_attached_file :thumbnail, :url => "/:class/:attachment/:id/:basename.:extension", :path => ":rails_root/public/:class/:attachment/:id/:basename.:extension"
  has_attached_file :law_doc_attachment, :url => "/:class/:attachment/:id/:basename.:extension", :path => ":rails_root/public/:class/:attachment/:id/:basename.:extension" #has to seperate has_attached_file to avoid error befor processing
end
