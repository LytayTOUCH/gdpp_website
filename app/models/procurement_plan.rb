class ProcurementPlan < ActiveRecord::Base
  belongs_to :procurement_entity

  validates :name , presence: true
  validates :procurement_entity_id , presence: true
  validates :procurement_plan_type , presence: true
  validates :year , presence: true

  has_attached_file :procurement_plan_file, 
  :url => "/:class/:attachment/:id/:basename.:extension",
  :path => ":rails_root/public/:class/:attachment/:id/:basename.:extension"
  validates_attachment :procurement_plan_file, :content_type => { :content_type => [
    "image/jpeg", "image/jpg", "image/gif", "image/png", 
    "application/pdf", "application/vnd.ms-excel", 
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", 
    "application/msword", 
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document"] },
     :size => { :in => 0..5.megabytes }

end
