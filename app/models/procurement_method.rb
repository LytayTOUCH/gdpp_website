class ProcurementMethod < ActiveRecord::Base
  has_many :awarding_contracts
  has_many :purchase_orders
  validates :name, presence: true

end
