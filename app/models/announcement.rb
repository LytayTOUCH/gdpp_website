class Announcement < ActiveRecord::Base
  belongs_to :announcement_type
  belongs_to :procurement_entity
  belongs_to :budget_source
end
