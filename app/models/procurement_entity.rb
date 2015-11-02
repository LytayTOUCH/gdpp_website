class ProcurementEntity < ActiveRecord::Base
  has_many :announcements

  belongs_to :procurement_category

  validates :name, presence: true

  scope :sort_by_last_update, -> {order ("procurement_entities.updated_at DESC")}


  has_attached_file :logo, styles: { medium: "200x200>", thumb: "100x100>" }, 
  # default_url: "/images/:style/missing.png", 
  url: "/logo/:class/:id/:style/:basename.:extension", 
  path: ":rails_root/public/logo/:class/:id/:style/:basename.:extension"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
end
