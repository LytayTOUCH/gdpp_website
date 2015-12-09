class ProcurementCategory < ActiveRecord::Base
  has_many :procurement_entities
  has_many :purchase_orders

  validates :name, presence: true
end
