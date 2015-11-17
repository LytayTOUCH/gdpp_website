class LawCategory < ActiveRecord::Base
  has_many :law_regulations

  validates :name, presence: true
end
