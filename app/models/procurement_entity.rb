class ProcurementEntity < ActiveRecord::Base
  has_many :announcements

  validates :name, presence: true
end
