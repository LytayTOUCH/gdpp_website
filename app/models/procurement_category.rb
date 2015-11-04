class ProcurementCategory < ActiveRecord::Base
  has_many :procurement_entities

  validates :name, presence: true
end
