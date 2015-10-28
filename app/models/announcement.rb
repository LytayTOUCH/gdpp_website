class Announcement < ActiveRecord::Base
  belongs_to :announcement_type
  belongs_to :procurement_entity
  belongs_to :budget_source

  validates :title, presence: true
  validates :description, presence: true
  validates :announcement_type_id, presence: true
  validates :procurement_entity_id, presence: true
  validates :budget_source_id, presence: true
  validates :open_register_date, presence: true
  validates :close_submit_date, presence: true
  validates :open_bid_doc_date, presence: true

  has_attached_file :announcement_file, :url => "/:class/:attachment/:id/:basename.:extension", :path => ":rails_root/public/:class/:attachment/:id/:basename.:extension"
  has_attached_file :bidding_file, :url => "/:class/:attachment/:id/:basename.:extension", :path => ":rails_root/public/:class/:attachment/:id/:basename.:extension"
  validates_attachment :announcement_file, :bidding_file, :content_type => { :content_type => [
    "image/jpeg", "image/jpg", "image/gif", "image/png", 
    "application/pdf", "application/vnd.ms-excel", 
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", 
    "application/msword", 
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document"] },
     :size => { :in => 0..5.megabytes }

end
