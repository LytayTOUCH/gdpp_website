class BudgetSource < ActiveRecord::Base
  has_many :announcements
end
