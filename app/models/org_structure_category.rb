class OrgStructureCategory < ActiveRecord::Base
  has_many :org_structures

  validates :name, presence: true
end
