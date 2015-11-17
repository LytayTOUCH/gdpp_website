class ImageSlide < ActiveRecord::Base

  validates :title, presence: true
  validates :image, presence: true
  
  has_attached_file :image, styles: { medium: "200x200>", thumb: "100x100>" }, 
  default_url: "/missing/:style/no-image.png",
  url: "/:class/:id/:style/:basename.:extension", 
  path: ":rails_root/public/:class/:id/:style/:basename.:extension"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
