class PurchaseOrder < ActiveRecord::Base
  belongs_to :procurement_method
  belongs_to :procurement_category

  validates :project_name , presence: true
  validates :procurement_category_id , presence: true
  validates :procurement_method_id , presence: true
  validates :purchase_order_date , presence: true

  has_attached_file :document, :url => "/:class/:attachment/:id/:basename.:extension", :path => ":rails_root/public/:class/:attachment/:id/:basename.:extension"
  validates_attachment :document, :content_type => { :content_type => [
    "image/jpeg", "image/jpg", "image/gif", "image/png", 
    "application/pdf", "application/vnd.ms-excel", 
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", 
    "application/msword", 
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document"] },
     :size => { :in => 0..5.megabytes }
end
