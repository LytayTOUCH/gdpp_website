class UserProfile < ActiveRecord::Base
  belongs_to :admin
  accepts_nested_attributes_for :admin, allow_destroy: true

  validates :name , presence: true
  validates :address , presence: true
  validates :phone , presence: true
  validates :position , presence: true
end
