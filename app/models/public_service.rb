class PublicService < ActiveRecord::Base
  validates :name, presence: true
  validates :position , presence: true
  validates :phone , presence: true
  validates :email , presence: true
end