class ProcurementMethod < ActiveRecord::Base
  has_many :awarding_contracts
  
  validates :name, presence: true

end
